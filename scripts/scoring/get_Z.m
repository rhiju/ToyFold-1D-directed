function [Z,conf_prob] = get_Z(x,d,p,epsilon,delta);
%
%
%
num_bends = score_bends(d);
num_pairs = score_pairs(p);
E = delta * num_bends + epsilon * num_pairs;
Z = sum( exp( -E ) );
conf_prob = exp(-E)/Z;

