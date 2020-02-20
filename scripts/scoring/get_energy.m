function E =  get_energy(d,p,epsilon,delta)
% E = get_energy(d,p)
% 
% Energy in toyfold model
%
%  d = [Nbeads x Nconformations] input directions (array of +/-1's)
%  p = [Nbeads x Nconformations] partners  (0 if bead is unpaired,
%        otherwise index of partner from 1,... Nbeads )
%  epsilon = energy bonus for each pair (use negative number for bonus), 
%               units of kT. [Default -2]
%  delta = energy penalty for each bend (use positive number for penalty), 
%               units of kT. [Default 1]


if ~exist( 'epsilon','var') epsilon = -2; end;
if ~exist( 'delta','var') delta = 1; end;

num_bends = score_bends(d);
num_pairs = score_pairs(p);
E = delta * num_bends + epsilon * num_pairs;