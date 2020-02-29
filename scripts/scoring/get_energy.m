function E =  get_energy(d,p,params)
% E = get_energy(d,p,params)
% 
% Energy in toyfold model
%
% Inputs
%  d = [Nbeads x Nconformations] input directions (array of +/-1's)
%  p = [Nbeads x Nconformations] partners  (0 if bead is unpaired,
%        otherwise index of partner from 1,... Nbeads )
% params = Energy parameter values for delta, epsilon, etc. [MATLAB struct]
%
% Output
% E = [Nconformations] energies for each conformation 
%
% (C) R. Das, Stanford University 2020

if ~exist( 'params','var') params = get_default_energy_parameters(); end;

num_bends = score_bends(d);
num_pairs = score_pairs(p);
E = params.delta * num_bends + params.epsilon * num_pairs;