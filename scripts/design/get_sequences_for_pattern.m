function sequences = get_sequences_for_pattern( pattern );
% sequences = get_sequences_for_pattern( pattern );
%
% get list of all possible sequences consistent with design pattern.
% E.g., pattern of AANUU  will lead to AAAUU, AACUU, AAUUU, AAGUU.
%
% Input
%   pattern = sequence like AANUU, where characters like N,R,Y,W, and S are
%                wild cards, and A, U, C, and G are preserved.
%
% Output
%   sequences = cell of sequence strings.
%
% (C) R. Das, Stanford University, 2020
sequences = {};
N = length( pattern );

for j = 1:N; num_nts(j) = length( get_nts_for_symbol( pattern(j) ) ); end
num_sequences = cumprod( num_nts );

for q = 1:num_sequences(end)
    sequence = '';
    prev_num_sequences = 1;
    for j = 1:N
        nts = get_nts_for_symbol( pattern(j) );
        sequence = [sequence, nts( mod(ceil(q/prev_num_sequences)-1,length(nts))+1 )];
        prev_num_sequences = num_sequences(j);
    end
    sequences{q} = sequence;
end

% check that all are distinct
assert( length( sequences ) == length( unique( sequences ) ) );
