function enumerative_design( secstruct, pattern );
% enumerative_design( secstruct, pattern );
%
% enumerative design -- kind of a fail
% could generalize this pretty easily
%
% (C) R. Das, Stanford University, 2020
N = length( secstruct );
if ~exist( 'pattern', 'var' ) pattern = ['A',repmat( 'N', 1, N-1 )]; end;
if ~exist( 'epsilon','var') epsilon = -2; end;
if ~exist( 'delta','var') delta = 1; end;
assert( length( pattern ) == length( secstruct ) );

sequences = get_sequences_for_pattern( pattern );
sequences = filter_by_secstruct( sequences, secstruct );
%[p_target,x,d,p] = test_designs( sequences, secstruct );


%% are some sequences better designs than others?
x = {}; d = {}; p = {};
x_target = {}; d_target = {}; p_target = {};
Z = []; Z_target = [];
for q = 1:length( sequences )
    sequence = sequences{q};
    [Z(q),Z_target(q),x{q},d{q},p{q}] = test_design(sequence,secstruct,epsilon,delta);
end
p_target = Z_target./Z;
[p_sort,idx] = sort( -p_target )

%% calculate base pair probability maps to visualize alternatives.
count = 0;
colormap( 1 - gray(100));
clf
for q = [idx(1:16),idx(end-15:end)]
    count = count+1;
    subplot(4,8,count);
    bpp{q} = get_bpp(x{q},d{q},p{q},epsilon,delta);
    imagesc( bpp{q} );
    title( [sequences{q},'\newline',num2str(p_target(q))] );
end


