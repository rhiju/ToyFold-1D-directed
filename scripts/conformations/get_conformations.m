function [x,d] = get_conformations( secstruct );
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
%        2^(Nbeads-1)   
%  d = [Nbeads x Nconformations] input directions
% 
% (C) R. Das, Stanford University

x = [];

% partner is array with same length as chain
%  that records the partner of each bead 
%  (set to 0 if bead has no partner).
[is_chainbreak, secstruct] = parse_out_chainbreak( secstruct );
[partner] = secstruct_to_partner( secstruct );
N = length( secstruct ); 

% without loss of generality,
%  place first bead at x = 0,and point in positive direction. 
if N > 0;
    x = [0];
    d = [1];
end

stem_assignment = figure_out_stem_assignment( secstruct );

% How about the rest?
for i = 2:N
    if ~is_chainbreak(i-1)
        if stem_assignment(i) > 0 && ...
                stem_assignment(i) == stem_assignment(i-1) ...
                % continuing a stem. go in the same direction!
            d(i,:) = d(i-1,:);
        else
            q = size(x,2);
            % two choices for next move -- forward or backward.
            % Forward:
            d(i,1:q) = 1;
            
            % Backward (note that these are 'new' histories).
            newblock = size(x,2) + [1:q];
            x(:, newblock) = x(:, 1:q);
            d(:, newblock) = d(:, 1:q);
            d(i, newblock) = -1;
        end
        x(i,:) = x(i-1,:)+d(i,:);
    else
        q = size(x,2);
        % new strand! can go anywhere! lots of new options to enumerate
        for xx = -(2*N-1):(2*N-1)
            for dd = [1 -1];
                newblock = size(x,2) + [1:q];
                x(:,newblock) = x(:,1:q);
                d(:,newblock) = d(:,1:q);
                x(i,newblock) = xx;
                d(i,newblock) = dd;
            end
        end
    end
    
    
    % filter trajectories that obey pairs -- positions are at same level, 
    %   and going in opposite directions
    if partner(i) == 0; continue; end;
    if partner(i) > i;  continue; end;    
    gp = find( x(i,:) == x(partner(i),:) & d(i,:) == -d(partner(i),:) );
    x = x(:,gp);
    d = d(:,gp);
end

% re-order trajectories, sorted by the number of bends
num_bends = score_bends( d );
[~,idx] = sort( num_bends );

x = x(:,idx);
d = d(:,idx);

