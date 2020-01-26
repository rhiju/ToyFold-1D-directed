function draw_conformations( x );
% draw_conformations( x );
%
% Draw out coordinates for conformations.
%
% INPUT
%  x = [Nbeads x Nconformations] all sets of conformations.
%
% (C) R. Das, Stanford University
cla;
N = size( x, 1 ); % number of beads
Q = size( x, 2 ); % number of conformations
spacing = max( max(x) )-min(min(x))+0.5;
for q = 1:Q
    offset = spacing*q;
    plot( [1:N], offset + x(:,q) ); hold on
end
set(gcf, 'PaperPositionMode','auto','color','white');
axis off
axis equal


