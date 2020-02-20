function nts = get_nts_for_symbol( s )
% nts = get_nts_for_symbol( s )
%
% Returns, e.g., 'ACGU' for 'N'
%
% (C) R. Das, Stanford University, 2020

nts = '';
switch s
    case {'A','G','C','U'}
        nts = s;
    case 'R'
        nts = 'AG';
    case 'Y'
        nts = 'CU';
    case 'N'
        nts = 'ACGU';
    case 'W'
        nts = 'AU';
    case 'S'
        nts = 'CG';
end
