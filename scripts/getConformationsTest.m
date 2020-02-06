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

% test motif expansion
% 3-way junction
[x,d] = get_conformations( '(.( )..( )....)' );
assert( size(x,2)  == 126);

% secondary structure harboring 3 way junction and other motifs.
[x,d] = get_conformations( '..((.((..((...)))..)..(((...)))....))' );
assert( size(x,2)  == 4*126*3*3*3*3);


% enumerate conformations for a sequence
[x,d,p] = get_conformations( '','NNN' );
assert( size(x,1) == 3 );
assert( size(x,2) == 5 );
% look for hairpin as 'best' conformation
assert( all( x(:,1) == [0,1,0]') );
assert( all( d(:,1) == [1,1,-1]') );
assert( all( p(:,1) == [3,0,1]') );

[x,d,p] = get_conformations( '','AAA' );
assert( size(x,1) == 3 );
assert( size(x,2) == 4 );
assert( all( p(:) == 0 ) );

[x,d,p] = get_conformations('','UAUUA');
assert( size(x,1) == 5 );
% look for hairpin as 'best' conformation
assert( all( x(:,1) == [0,1,2,1,0]') );
assert( all( d(:,1) == [1,1,1,-1,-1]') );
assert( all( p(:,1) == [5,4,0,2,1]') );
assert( size(x,2) == 28 );

