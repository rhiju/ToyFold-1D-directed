x = get_conformations('.....');
assert( size(x,1) == 5 );
assert( size(x,2) == 2^3);
x = get_conformations('((.))');
assert( size(x,1) == 5 );
assert( size(x,2) == 2);
num_bends = score_bends( x );
assert( all( num_bends == [1,3]) );
draw_conformations( x );

% draw_conformations( get_conformations( '(((...)))' ))

