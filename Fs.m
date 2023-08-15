%function out = Fs(c,phi,g,gw,m,z,a)
% FS Computes the static factor of safety
%	Syntax: out = Fs(g,JCSn,JRCn,phibn,tn,a) assigns to out the value of Fstat
%	Arguments:    g	= material unit weight (kN/m3)
%			   JCSn = Joint wall compressive strength (MPa)
%              JRCn = Joint roughness coefficient
%             phibn = basic friction angle (degree)
%			     tn	= slope-normal thickness of the failure slab (m)
%			     a 	= slope angle (degree)
%
%	Any of the above arguments can be arrays

function out = Fs(g,JCSn,JRCn,phibn,tn,a)
out = tan((JRCn .* log10( JCSn ./ (g .* tn .* cos(a.*pi./180))) + phibn) .* pi ./ 180) ./ tan(a.*pi./180);
