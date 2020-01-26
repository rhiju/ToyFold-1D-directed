function num_bends = score_bends( x );
%  num_bends = score_bends( x );
%
% Take a bunch of conformations and score the number of bends in each
% conformation. For use in determining bending energy penalty ('Delta' in
% toyfold notes).
%
% INPUT
%
% x = [num beads x num conformations] positions of each bead
%
% OUTPUT
%
% num_bends = [1 x num_conformations] number of bends
%
% (C) R. Das, Stanford University, 2020


d = x(2:end,:) - x(1:(end-1),:);
num_bends = sum( d(1:end-1,:) ~= d(2:end,:) );


