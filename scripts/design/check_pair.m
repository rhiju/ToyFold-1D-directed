function ok = check_pair( s1, s2 )
% ok = check_pair( s1, s2 )
%
% Returns 1 if s1, s2 are OK for Watson-Crick pairing.
%  E.g., 
%    check_pair( 'A', 'U' ) --> 1
%    check_pair( 'U', 'U' ) --> 0
%
%  Note that we don't have G*U in current toyfold model:
%    check_pair( 'G', 'U' ) --> 0
%
% Inputs
%  s1 = character (A,C,G,U)
%  s2 = character (A,C,G,U)
%
% Output
%  ok = are they pairable in Toyfold model?
%
% (C) R. Das, Stanford University

ok = 0;
s = [s1,s2];
%if any(strcmp(s,{'AU','UA','GC','CG','GU','UG'})) 
if any(strcmp(s,{'AU','UA','GC','CG'})) 
    ok = 1;
end
