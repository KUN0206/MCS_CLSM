%function out = fs(c,phi,g,gw,m,z,a)
% FS Computes the static factor of safety
%	Syntax: out = fs(c,phi,g,gw,m,z,a) assigns to out the value of Fstat
%	Arguments: c 	= effective cohesion;
%			     phi = effective friction angle;
%			     g	= material unit weight;
%			     gw	= unit weight of water;
%			     m	= proportion of the slab thickness that is saturated
%			     z	= slope-normal thickness of the failure slab
%			     a 	= slope angle (deg)
%
%	Any of the above arguments can be arrays
%
%  
%%
%out = (c + ((g - m.*gw).*z.*(cos(a.*pi./180).*cos(a.*pi./180))).*...
%   tan(phi.*pi./180)) ./ (g .* z.* sin(a.*pi./180) .* cos(a.*pi./180));
%%
function out = Fs(g,JCSn,JRCn,phibn,tn,a)
out = tan((JRCn .* log10( JCSn ./ (g .* tn .* cos(a.*pi./180))) + phibn) .* pi ./ 180) ./ tan(a.*pi./180);

% out = JRCn .* log10( JCSn ./ (g .* tn)) + phibn ;
% out = tan(K - JRCn .* log10 ( cos(a.*pi./180) ) ./ tan(a.*pi./180);