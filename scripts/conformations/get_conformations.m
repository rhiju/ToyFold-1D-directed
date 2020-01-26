function x = get_conformations( secstruct );
% x = get_conformations( secstruct );
%
% Figure out all the conformations (bead positions)
%  that are consistent with a secondary structure.
%
% Without loss of generality, conformations are assumed to 
%  start out at origin (0) and initially point in positive direction.
%
%
% INPUT
% secstruct = Secondary structure in dot-parens notation, e.g.
%                      '((.))'
%
% OUTPUT
%  x = [Nbeads x Nconformations] all sets of conformations.
%        If there are no base pairs specified, should get
%        2^(Nbeads-2)   
% 
% (C) R. Das, Stanford University

x = [];

% partner is array with same length as chain
%  that records the partner of each bead 
%  (set to 0 if bead has no partner).
partner = secstruct_to_partner( secstruct );

N = length( secstruct ); 

% without loss of generality,
%  place first bead at x = 0,and point in positive direction. 
if N > 0;
    x = [0];
end
if N > 1;
    x = [0 1]';
end

% How about the rest?
for i = 3:N
    q = size( x, 2 );
    % two choices for next move -- forward or backward.
    % add next bead position. Forward:
    x(i,1:q) = x(i-1,1:q)+1;

    % Backward (note that these are 'new' histories.
    x(:, (q+1) : 2*q) = x(:,1:q);
    x(i, (q+1): 2*q)  = x(i-1,(q+1): 2*q)-1;
    
    % filter trajectories that obey pairs
    if partner(i) == 0; continue; end;
    if partner(i) > i;  continue; end;    
    gp = find( x(i,:) == x(partner(i),:) );
    x = x(:,gp);
end

% re-order trajectories, sorted by the number of bends
num_bends = score_bends( x );
[~,idx] = sort( num_bends );

x = x(:,idx);


