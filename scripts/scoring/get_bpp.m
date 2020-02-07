function  bpp = get_bpp(x,d,p,epsilon,delta);
[Z,conf_prob] = get_Z(x,d,p,epsilon,delta);
N = size(x,1);
bpp = zeros(N,N);
for q = 1:size(x,2)
    partner = p(:,q);
    for m = 1:length(partner)
        if partner(m) > 0;
            bpp(m,partner(m)) = bpp(m,partner(m)) + conf_prob(q);
        end
    end
end
