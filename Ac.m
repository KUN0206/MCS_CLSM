function out = Ac(Fs,slope)
% Ac computes the critical acceleration according to the Newmark model.
%	Syntax: out 0 Ac(Fs,slope)
%	Arguments: Fs = static factor of safety;
%			 slope = slope angle (degrees)
%
%	Any of the input arguments can be arrays

out = (Fs - 1) .* sin(slope .* pi ./ 180); 