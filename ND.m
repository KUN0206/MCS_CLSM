function out = dn93(logia,ac)
% Dn93 computes the Newmark displacement Dn according to '93 Jibson formula:
%	log(Dn) = 1.46 * log(Ia) - 6.642 * Ac + 1.546
% Syntax: out = Dn93(logia,ac)
% Arguments: logia = log(Ia), where Ia is the Arias intensity
%			ac  = critical acceleration
%
% Any of the arguments can be arrays
%In the current study, the following regression-based equation proposed by Jibson (2007) was used.
                    %   Log⁡〖D_n=0.215+〗  log⁡[(1-a_c/PGA)^2.341 (a_c/PGA)^(-1.438) ]                                                                      (4)
%where D_n in centimeters, PGA and a_c in g units.

out = exp(0.215-2.341.*log(1-(ac/logia))-1.438.*log(1-(ac/logia)));