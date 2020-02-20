function [p_target,x,d,p] = test_design(sequence,secstruct,epsilon,delta);
% [p_target,x,d,p] = test_design(sequence,secstruct,epsilon,delta);
%
% Main script for testing if a sequence folds well into target 
%   secondary structure.
%
% Inputs
%  sequence  = sequence like 'AAACCCGGA'
%  secstruct = target secondary structure in dot parens notation
%  epsilon = energy bonus for each pair (use negative number for bonus), 
%               units of kT. [Default -2]
%  delta = energy penalty for each bend (use positive number for penalty), 
%               units of kT. [Default 1]
%
% Output
%  p_target = Fraction of conformations with target 
%                secondary structure. (Higher is better.)
%  x = [Nbeads x Nconformations] all sets of conformations.
%        If there are no base pairs specified, should get
%        2^(Nbeads-1). First position is always 0.   
%  d = [Nbeads x Nconformations] input directions (array of +/-1's)
%  p = [Nbeads x Nconformations] partners  (0 if bead is unpaired,
%        otherwise index of partner from 1,... Nbeads )
%
% (C) Rhiju Das, Stanford University 2020

if ~exist( 'epsilon','var') epsilon = -2; end;
if ~exist( 'delta','var') delta = 1; end;

[x,d,p] = get_conformations('',sequence);
Z = get_Z(x,d,p,epsilon,delta);

[x_target,d_target,p_target] = get_conformations(secstruct,sequence);
Z_target = get_Z(x_target,d_target,p_target,epsilon,delta);

p_target = Z_target/Z;
