function [p_target,x,d,p] = test_design(sequence,secstruct,epsilon,delta);

if ~exist( 'epsilon','var') epsilon = -2; end;
if ~exist( 'delta','var') delta = 1; end;

[x,d,p] = get_conformations('',sequence);
Z = get_Z(x,d,p,epsilon,delta);

[x_target,d_target,p_target] = get_conformations(secstruct,sequence);
Z_target = get_Z(x_target,d_target,p_target,epsilon,delta);

p_target = Z_target/Z;
