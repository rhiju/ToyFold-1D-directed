function is_pk = check_pseudoknot( partner );
% is_pk = check_pseudoknot( partner );
%
% Input
%  p = [Nbeads x Nconformations] partners  (0 if bead is unpaired,
%        otherwise index of partner from 1,... Nbeads )
%
% Output
%  is_pk = partner involves any non-nested pairings
%


for i = 1:size( partner, 2)
    p = partner(:,i);
    % could be done in a smarter way...
    % get list of base pairs...
    bps = [];
    for k = 1:size(p,1);
        if p(k) > 0 & p(k)>k
            bps = [bps; k,p(k)];
        end
    end
    % now check for crossings
    is_pk(i) = 0;
    for m = 1:size(bps,1)
        for n = (m+1):size(bps,1)
            if bps(m,1)<bps(n,1) & bps(n,1) < bps(m,2) & bps(m,2) < bps(n,2)
                is_pk(i) = 1; break;
            end
            if bps(n,1)<bps(m,1) & bps(m,1) < bps(n,2) & bps(n,2) < bps(m,2)
                is_pk(i) = 1; break;
            end
        end
        if is_pk(i); break; end;
    end
end
