function [Z,conf_prob] = get_Z(x,d,p,epsilon,delta);
% [Z,conf_prob] = get_Z(x,d,p,epsilon,delta);
%
% Partition function calculation.
%
% INPUT
%  x = [Nbeads x Nconformations] all sets of conformations.
%        If there are no base pairs specified, should get
%        2^(Nbeads-1). First position is always 0.   
%  d = [Nbeads x Nconformations] input directions (array of +/-1's)
%  p = [Nbeads x Nconformations] partners  (0 if bead is unpaired,
%        otherwise index of partner from 1,... Nbeads )
%  epsilon = energy bonus for each pair (use negative number for bonus), 
%               units of kT. [Default -2]
%  delta = energy penalty for each bend (use positive number for penalty), 
%               units of kT. [Default 1]
%
%
% OUTPUT
% secstruct = Secondary structure in dot-parens notation, e.g.
%                 '((.))'. Give [] or '' if you want
%                  the secondary structures to be enumerated
% sequence  = [optional] Input sequence (array of 0's and 1's) with
%                 'colors'. Required if you want secstruct's to be
%                 enumerated.
%
% 
% (C) R. Das, Stanford University, 2020

if ~exist( 'epsilon','var') epsilon = -2; end;
if ~exist( 'delta','var') delta = 1; end;

num_bends = score_bends(d);
num_pairs = score_pairs(p);
E = delta * num_bends + epsilon * num_pairs;
Z = sum( exp( -E ) );
conf_prob = exp(-E)/Z;

