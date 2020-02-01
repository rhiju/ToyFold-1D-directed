function num_bends = score_bends( d );
%  num_bends = score_bends( x );
%
% Take a bunch of conformations and score the number of bends in each
% conformation. For use in determining bending energy penalty ('Delta' in
% toyfold notes).
%
% INPUT
%
% d = [Nbeads x Nconformations] input directions
%
% OUTPUT
%
% num_bends = [1 x num_conformations] number of bends
%
% (C) R. Das, Stanford University, 2020

num_bends = sum( d(1:end-1,:) ~= d(2:end,:) );


