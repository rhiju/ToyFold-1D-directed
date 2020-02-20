function ok_sequences = filter_by_secstruct( sequences, secstruct );
% ok_sequences = filter_by_secstruct( sequences, secstruct );
%
% filter list of sequences to ones that are consistent with target
% secstruct
%
% Inputs:
% sequences = cell of input sequences
% secstruct = target secondary structure (dot-parens notation)
%
% Output:
% ok_sequences = cell of sequences, filtered for those that are consistent
%                  with secstruct.
%
% (C) R. Das, Stanford University 2020

bps = convert_structure_to_bps_TOYFOLD( secstruct );
ok_sequences = {};
for q = 1:length( sequences )
    sequence = sequences{q};
    ok = 1;
    for m = 1:size( bps, 1 )
        if ~check_pair(sequence(bps(m,1)), sequence(bps(m,2)))
            ok = 0; break;
        end
    end
    if ok
        ok_sequences = [ok_sequences,{sequence}];
    end
end
