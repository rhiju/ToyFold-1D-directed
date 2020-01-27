function stem_assignment = figure_out_stem_assignment( secstruct )
%
% INPUT
%  secstruct = secondary structure in dot-parens notation
%
% OUTPUT
% stem_assignment = 1XN array, 0 for non-pairs; 1,2,... index for each
%          stem.
bps = convert_structure_to_bps_TOYFOLD( secstruct );
stems = parse_stems_from_bps_TOYFOLD( bps );

stem_assignment = zeros(1,length(secstruct));
for i = 1:length( stems )
    stem = stems{i};
    for j = 1:size( stem, 1 )
        stem_assignment( stem(j,1) ) = i;
        stem_assignment( stem(j,2) ) = i;
    end    
end    
