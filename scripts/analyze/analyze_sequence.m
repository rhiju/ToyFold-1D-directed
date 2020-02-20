function [x,d,p] = analyze_sequence( sequence, epsilon, delta );
% analyze_sequence( sequence );
% analyze_sequence( sequence, epsilon, delta );
% 
% Analyze and plot lowest energy conformations, base pair probability
%  matrix, and simulated M2seq data for sequence
%
% INPUT
%  sequence = sequence like 'AAACCCGGA'
%  epsilon = energy bonus for each pair (use negative number for bonus), 
%               units of kT. [Default -2]
%  delta = energy penalty for each bend (use positive number for penalty), 
%               units of kT. [Default 1]
%
% (C) R. Das, Stanford University

if ~exist( 'epsilon','var') epsilon = -2; end;
if ~exist( 'delta','var') delta = 1; end;
N = length( sequence );

[x,d,p] = get_conformations('',sequence);

clf; 
subplot(1,2,1); 
draw_conformations(x,d,p,8,sequence);

subplot(2,2,2);
bpp = get_bpp(x,d,p,epsilon,delta);
imagesc(bpp,[0 1]); axis image
hold on; plot([0.5:N+0.5],[0.5:N+0.5]); title( ['BPP for ',sequence] );
colormap( 1 - gray(100));

subplot(2,2,4);
[M2seq, profile] = get_M2seq( sequence );
imagesc(M2seq,[0 1]); axis image
hold on; plot([0.5:N+0.5],[0.5:N+0.5]); title( ['BPP for ',sequence] );
