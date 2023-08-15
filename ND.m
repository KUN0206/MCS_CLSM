function out = ND(logPGA,ac)
% ND computes the Newmark displacement Dn according to '2007 Jibson formula:

out = exp(0.215-2.341.*log(1-(ac/logPGA))-1.438.*log(1-(ac/logPGA)));