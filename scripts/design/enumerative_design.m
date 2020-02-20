function enumerative_design( secstruct, pattern );
% enumerative_design( secstruct, pattern );
%
% enumerative design -- kind of a fail
% could generalize this pretty easily
%
% (C) R. Das, Stanford University, 2020
N = length( secstruct );
if ~exist( 'pattern', 'var' ) pattern = ['A',repmat( 'N', 1, N-1 )]; end;
if ~exist( 'epsilon','var') epsilon = -2; end;
if ~exist( 'delta','var') delta = 1; end;
assert( length( pattern ) == length( secstruct ) );

sequences = get_sequences_for_pattern( pattern );
sequences = filter_by_secstruct( sequences, secstruct );
%[p_target,x,d,p] = test_designs( sequences, secstruct );
fprintf( 'Will test %d sequences...\n', length(sequences) );

%% are some sequences better designs than others?
x = {}; d = {}; p = {};
x_target = {}; d_target = {}; p_target = [];
Z = []; Z_target = [];
for q = 1:length( sequences )
    sequence = sequences{q};
    [p_target(q),x{q},d{q},p{q}] = test_design(sequence,secstruct,epsilon,delta);
end
[p_sort,idx] = sort( -p_target );
p_target = p_target( idx );
x = x( idx );
d = d( idx );
p = p( idx );
sequences = sequences(idx);

%% calculate base pair probability maps to visualize alternatives.
colormap( 1 - gray(100));
clf
subplot(1,2,1);
q = 1;
imagesc( get_bpp(x{q},d{q},p{q},epsilon,delta),[0 1] );
title( ['Best design\newline',sequences{q},'\newline',num2str(p_target(q))] );

subplot(1,2,2);
q = length(x);
imagesc(get_bpp(x{end},d{end},p{end},epsilon,delta),[0 1] );
title( ['Worst design\newline',sequences{end},'\newline',num2str(p_target(q))] );



