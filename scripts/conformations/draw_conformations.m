function draw_conformations( x, d, secstruct );
% draw_conformations( x, secstruct );
%
% Draw out coordinates for conformations.
%
% TODO: identify stems & junctions and lay them out in a standard way, 
%         a la eterna or ribodraw or varna.
%
% INPUT
%  x = [Nbeads x Nconformations] all sets of conformations.
%  secstruct = secondary structure in dot parens notation (optional)
%
% (C) R. Das, Stanford University, 2020

if ischar( x )
    secstruct = x;
    [x,d,p] = get_conformations( secstruct );
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
    offset = spacing*(q-1);
    plot( z, offset + x(:,q),'o-','linew',3 ); hold on
    if exist( 'p', 'var' )
        for m = [find(p(:,q)>[1:N]')]'
            idx = [m p(m,q)];
            plot( z(idx),offset + x(idx,q),'k:','linew',2);
        end
    end
end
set(gcf, 'PaperPositionMode','auto','color','white');
axis off
%axis equal


