assert( strcmp(get_nts_for_symbol( 'A' ),'A' ) );
assert( strcmp(get_nts_for_symbol( 'N' ),'ACGU' ) ); 
assert( strcmp(get_nts_for_symbol( 'W' ),'AU' ) );

sequences = get_sequences_for_pattern( 'AANUU' );
assert( all( strcmp(sequences,{'AAAUU','AACUU','AAGUU','AAUUU'} ) ) );