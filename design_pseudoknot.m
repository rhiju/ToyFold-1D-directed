%% this is what we're trying to design:
%secstruct =  '((..[)).]';
secstruct =  '((...[[)).]]';
draw_conformations( secstruct );

%%
analyze_sequence('CGAAACCCGAGG');

%%
analyze_sequence('CCAAAGGGGACC');
%%
[x,d,p] = get_conformations('','CCAAAGGGGACC');
clf; imagesc(get_bpp(x,d,p,epsilon,delta))
hold on; plot([0:N+1],[0:N+1]);
%%


%%
% enumerative design -- kind of a fail
% could generalize this pretty easily
N = length( secstruct );
nts = 'AU';
sequences = {};
epsilon = -3; delta = 1;
for q = 1:(2^(N-1))
    sequence = nts(1);
    for j = 1:(N-1)
        sequence = [sequence, nts( mod(ceil(q/2^(j-1)),2)+1 )];
    end
    sequences{q} = sequence;
end
% check that all are distinct
assert( length( sequences ) == length( unique( sequences ) ) );

% filter for pairs
bps = convert_structure_to_bps_TOYFOLD( secstruct );
ok_sequences = {};
for q = 1:(2^(N-1))
    sequence = sequences{q};
    ok = 1;
    for m = 1:size( bps, 1 )
        if strcmp(sequence(bps(m,1)), sequence(bps(m,2)))
            ok = 0; break;
        end
    end
    if ok
        ok_sequences = [ok_sequences,{sequence}];
    end
end
sequences = ok_sequences;

%% are some sequences better designs than others?
x = {}; d = {}; p = {};
x_target = {}; d_target = {}; p_target = {};
Z = []; Z_target = [];
for q = 1:length( sequences )
    sequence = sequences{q};
    tic
    [x{q},d{q},p{q}] = get_conformations('',sequence);
    toc
    Z(q) = get_Z(x{q},d{q},p{q},epsilon,delta);
    tic
    [x_target{q},d_target{q},p_target{q}] = get_conformations(secstruct,sequence);
    toc
    Z_target(q) = get_Z(x_target{q},d_target{q},p_target{q},epsilon,delta);
end
p_target = Z_target./Z;
[p_sort,idx] = sort( -p_target )

%% calculate base pair probability maps to visualize alternatives.
count = 0;
colormap( 1 - gray(100));
clf
for q = [idx(1:16),idx(end-15:end)]
    count = count+1;
    subplot(4,8,count);
    bpp{q} = get_bpp(x{q},d{q},p{q},epsilon,delta);
    imagesc( bpp{q} );
    title( [sequences{q},'\newline',num2str(p_target(q))] );
end




