function draw_conformations( x, d, secstruct );
% draw_conformations( x, secstruct );
%
% Draw out coordinates for conformations.
%
% INPUT
%  x = [Nbeads x Nconformations] all sets of conformations.
%  secstruct = secondary structure in dot parens notation (optional)
%
% (C) R. Das, Stanford University
if ischar( x )
    secstruct = x;
    [x,d] = get_conformations( secstruct );
end
N = size( x, 1 ); % number of beads
Q = size( x, 2 ); % number of conformations

% Figure out where to laterally draw beads (z)
z = [1:N];
if exist( 'secstruct','var' )
    stem_assignment = figure_out_stem_assignment( secstruct );
    z = 1;
    for n = 2:N
        if stem_assignment(n) > 0 && stem_assignment(n) == stem_assignment(n-1)
            z(n) = z(n-1);
        else
            z(n) = z(n-1)+1;
        end
    end
end

cla;
spacing = max( max(x) )-min(min(x))+0.5;
for q = 1:Q
    offset = spacing*q;
    plot( z, offset + x(:,q),'o-','linew',2 ); hold on
end
set(gcf, 'PaperPositionMode','auto','color','white');
axis off
axis equal


