function analyze_sequence( sequence, epsilon, delta );
%
%
%

if ~exist( 'epsilon','var') epsilon = -2; end;
if ~exist( 'delta','var') delta = 1; end;
N = length( sequence );


[x,d,p] = get_conformations('',sequence);

clf; 
subplot(1,2,1); 
draw_conformations(x,d,p);

subplot(2,2,2);
bpp = get_bpp(x,d,p,epsilon,delta);
imagesc(bpp); axis image
hold on; plot([0.5:N+0.5],[0.5:N+0.5]); title( ['BPP for ',sequence] );
colormap( 1 - gray(100));

subplot(2,2,4);
profile = 1-sum(bpp);
M2seq = [];
for n = 1:N
    sequence_mut = sequence;
    sequence_mut(n) = strrep(reverse_complement( sequence(n) ),'T','U');
    [x,d,p] = get_conformations('',sequence_mut);
    bpp = get_bpp(x,d,p,epsilon,delta);
    M2seq = [M2seq; 1-sum(bpp)];
end
imagesc(M2seq); axis image
hold on; plot([0.5:N+0.5],[0.5:N+0.5]); title( ['BPP for ',sequence] );
