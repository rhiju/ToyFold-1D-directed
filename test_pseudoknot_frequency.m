% The question -- for a 'general' sequence, 
%  how well can we approximate its ensemble as
%  a bunch of nested secondary structures and
%  a *single* tertiary structure? 
%
% Bonafide pseudoknot sequence
[x,d,p] = analyze_sequence( 'AGAAGCUAC' );
idx = find( check_pseudoknot(p) );
E = get_energy(d(:,idx),p(:,idx))
clf;
draw_conformations( x(:,idx), d(:,idx), p(:,idx) );


%%
nts = 'ACGU'; N = 12;
rand_sequence = nts(randi(4,1,N));
[x,d,p] = analyze_sequence( rand_sequence );
fprintf('Top conformations are pseudoknot?\n')
check_pseudoknot(p(:,1:8))
