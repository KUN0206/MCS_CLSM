nodata = 0;  

[rows,cols] = size(geo); % determine size of matrix
dn  = zeros(rows,cols);  % initialize output matrix

% lith_number = max(max(geo)) % number of lithological parameters
lith_number = 4;         

for k = 1:rows
   for l = 1:cols
      disp(['Processing: [' num2str(k) ', ' num2str(l) '] of [' num2str(rows) ', ' num2str(cols) ']']);
      % reading values from matrices
      gv 	= round(geo(k,l));
      alpha = slope(k,l);
      lia   = logia(k,l);
      if ((gv > 0) && (lia ~= nodata)) % changed & to &&
         % row vector of numsim number of columns
         g = LHSgamma(gv,:);
         jcsn = LHSjcs(gv,:); 
         jrcn = LHSjrc(gv,:);    
         phibn = LHSphib(gv,:);
         tn = LHSt(gv,:);
         
         % External call: routine implementing the Fstat formula:
         %fstat = fs(c,phi,g,gw,m,zeta,alpha);
         fstat = Fs(g,jcsn,jrcn,phibn,tn,alpha);
         
         % External call: routine implementing the Ac regression formula:
         ac_cr = Ac(fstat(fstat>1),alpha); % find edited
         
         % External call: routine implementing the Dn regression formula:
         dienne = ND(lia,ac_cr);
         
         % hist() syntax: [countsineachbin,centers] = hist(x, nbins)
         [Dhist, Dx] = hist(dienne, numbin); % compile histogram of Dn values.
         %histo = histogram(dienne, numbin);
         %[Dhist, Dx] = histcounts(dienne,numbin);
         
         Dcum = cumsum(Dhist);
         maxdc = max(Dcum);
         if (maxdc>0)
            Dcum = Dcum./maxdc; %normalization of a cumulative histogram
         end
         
         minDx = min(abs(Dx - thrvalue));

         % find value for which Dcum is closest to thrvalue
         ind = find(abs(Dx - thrvalue) == minDx); 
         dn(k,l) = 1 - Dcum(ind(1)); % find probability that Dn > thrvalue
       
         %break %%%%
      else % if invalid/nodata
         dn(k,l) = nodata;
      end
      
   end
end
disp('...done');

