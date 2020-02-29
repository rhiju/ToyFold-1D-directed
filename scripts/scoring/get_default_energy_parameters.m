function params = get_default_energy_parameters()
% params = get_default_energy_parameters()
%
% Currently epsilon = -2 (base pair strength) and 
%           delta = 1 (penalty for bending)
%
% which produces stable hairpins without requiring too many base pairs, as
%   is appropriate for beads that represent domains. Also proudces a lot 
%   of pseudoknots.
%
% OUTPUT
% params = struct with fields for delta, epsilon values.
%
% (C) R. Das, Stanford University 2020.

params = struct();
params.epsilon = -2;
params.delta = 1;
