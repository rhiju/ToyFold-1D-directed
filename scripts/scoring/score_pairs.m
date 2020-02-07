function num_pairs = score_pairs( p )
%  num_pairs = score_pairs( p )
%
% Take a bunch of pairing patterns and return number of pairs,
%  needed for scoring.
%
% INPUT
%
%  p = [Nbeads x Nconformations] partners  (0 if bead is unpaired,
%        otherwise index of partner from 1,... Nbeads )
%
% OUTPUT
%
% num_bends = [1 x num_conformations] number of pairs
%
% (C) R. Das, Stanford University, 2020

num_pairs = sum( (p>0), 1 )/2;

