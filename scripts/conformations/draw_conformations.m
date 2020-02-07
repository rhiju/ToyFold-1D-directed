function draw_conformations( x, d, p, max_struct );
% draw_conformations( secstruct );
% draw_conformations( x, d, p );
%
% Draw out coordinates for conformations.
%
% TODO: identify stems & junctions and lay them out in a standard way, 
%         a la eterna or ribodraw or varna.
%
% INPUT
%  secstruct = secondary structure in dot parens notation (optional)
%
%    OR
% (typical output from GET_CONFORMATIONS)
%  x = [Nbeads x Nconformations] all sets of conformations.
%  d = [Nbeads x Nconformations] input directions (array of +/-1's)
%  p = [Nbeads x Nconformations] partners  (0 if bead is unpaired,
%        otherwise index of partner from 1,... Nbeads )
%  max_struct = maximum number of structures to plot.
% (C) R. Das, Stanford University, 2020

if ischar( x )
    secstruct = x;
    [x,d,p] = get_conformations( secstruct );
end
if ~exist( 'max_struct', 'var' ); max_struct = 8; end;
if size(x,2) > max_struct
    x = x(:,1:max_struct);
    d = d(:,1:max_struct);
    p = p(:,1:max_struct);
end
N = size( x, 1 ); % number of beads
Q = size( x, 2 ); % number of conformations

cla;
spacing = max( max(x) )-min(min(x))+0.5;
for q = 1:Q
    offset = spacing*(q-1);

    % Figure out where to laterally draw beads (z)
    stem_assignment = figure_out_stem_assignment( p(:,q) );
    z = 1;
    for n = 2:N
        if stem_assignment(n) > 0 && stem_assignment(n) == stem_assignment(n-1)
            z(n) = z(n-1);
        else
            z(n) = z(n-1)+1;
        end
    end

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
axis equal


