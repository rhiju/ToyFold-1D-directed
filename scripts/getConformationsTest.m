[x,d] = get_conformations('.....');
assert( size(x,1) == 5 );
assert( size(x,2) == 2^4);

[x,d] = get_conformations('((.))');
assert( size(x,1) == 5 );
assert( size(x,2) == 1);
num_bends = score_bends( d );
assert( all( num_bends == [1]) );
draw_conformations( x, d );

[x,d] = get_conformations('(...)');
assert( size(x,1) == 5 );
assert( size(x,2) == 3 );
num_bends = score_bends( d );
assert( all( num_bends == [1,3,3]) );

[x,d] = get_conformations( '(((...)))' );
num_bends = score_bends( d );
assert( all( num_bends == [1,3,3]) );
draw_conformations( x, d, '(((...)))' );


[x,d] = get_conformations('.((...))' );
assert( size(x,1) == 8 );
assert( size(x,2) == 6 );

[x,d] = get_conformations('(( ))' );
assert( size(x,1) == 4 );
assert( size(x,2) == 1 );

[x,d] = get_conformations('.( )' );
assert( size(x,1) == 3 );
assert( size(x,2) == 2 );

[x,d] = get_conformations('(. )' );
assert( size(x,1) == 3 );
assert( size(x,2) == 2 );

[x,d] = get_conformations('( .)' );
assert( size(x,1) == 3 );
assert( size(x,2) == 2 );


% mmm doens't look right
[x,d] = get_conformations( '(.( )..( )....)' );
assert( length(x) == 126);

[x,d] = get_conformations( '..((.((..((...)))..)..(((...)))....))' );
assert( length(x) == 4*126*3*3*3*3);

%length( get_conformations( '(..( ))' ) )