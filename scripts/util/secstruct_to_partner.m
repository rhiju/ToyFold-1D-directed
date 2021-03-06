function [pairs,is_chainbreak] = secstruct_to_partner( secstruct );
%  pairs = secstruct_to_pairs( secstruct );
%
% INPUT:
%  secstruct = secondary structure in dot-parens notation
%
% OUTPUT:
%  pairs     = array of integers with length matching secstruct.
%                 0 = unpaired 
%                >0 = pairing partner
%
% (C) R. Das, Stanford University.

[is_chainbreak, secstruct] = parse_out_chainbreak( secstruct );

bps = convert_structure_to_bps_TOYFOLD( secstruct );
pairs = zeros( length(secstruct), 1 );
for i = 1:size( bps, 1 ); 
    pairs(bps(i,1)) = bps(i,2); 
    pairs(bps(i,2)) = bps(i,1); 
end;
