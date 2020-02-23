% The question -- for a 'general' sequence, 
%  how well can we approximate its ensemble as
%  a bunch of nested secondary structures and
%  a *single* tertiary structure? 
%
% Bonafide pseudoknot sequence
%%
epsilon = -2; delta = 1; % original default --> stable
sequence = 'AGAAGCUAC';

epsilon = -2; delta = 4; % try to get more cooperativity
sequence = 'CAGAAAAGGGCUGAACCC'; % now need 3-bp to get stable stems
clf;
tic
[x,d,p,E] = analyze_sequence( sequence, epsilon, delta, 0 );

% NOTE -- alternative structure arises where bottom stem opens.

toc
%%
idx = find( check_pseudoknot(p) );
draw_conformations( x(:,idx), d(:,idx), p(:,idx), 8, sequence );


%%
% Higher delta, lower epsilon results in fewer pseudoknots, as expected.
nts = 'ACGU'; N = 14;
rand_sequence = nts(randi(4,1,N));
epsilon = -2; delta = 5; % try to get more cooperativity
[x,d,p] = analyze_sequence( rand_sequence, epsilon, delta, 0);
fprintf('Top conformations are pseudoknot?\n')
check_pseudoknot(p(:,1:8))
