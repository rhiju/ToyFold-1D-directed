function [M2seq, profile] = get_M2seq(sequence,epsilon,delta);
% [M2seq, profile] = get_M2seq(sequence,epsilon,delta);
%
% INPUT
%  sequence = sequence like 'AAACCCGGA'
%  epsilon = energy bonus for each pair (use negative number for bonus), 
%               units of kT. [Default -2]
%  delta = energy penalty for each bend (use positive number for penalty), 
%               units of kT. [Default 1]
%
% (C) R. Das, Stanford University

if ~exist( 'epsilon','var') epsilon = -2; end;
if ~exist( 'delta','var') delta = 1; end;
N = length( sequence );

[x,d,p] = get_conformations('',sequence);
bpp = get_bpp(x,d,p,epsilon,delta);
profile = 1 - sum(bpp);

M2seq = [];
for n = 1:N
    sequence_mut = sequence;
    sequence_mut(n) = reverse_complement_TOYFOLD( sequence(n) );
    [x,d,p] = get_conformations('',sequence_mut);
    bpp = get_bpp(x,d,p,epsilon,delta);
    M2seq = [M2seq; 1-sum(bpp)];
end
