function y = setInitConc()

y = zeros(14,1);

%********** INITIAL VALUES
y(1) = 6.5e-4; % GlnB % http://identifiers.org/interpro/IPR002187
y(2) = 0;      % GlnBUMP
y(3) = 0;      % GlnBUMP2
y(4) = 0;      % GlnBUMP3
y(5) = 2e-3;   % GlnK % https://www.biocyc.org/gene?orgid=ECOLI&id=PROTEIN-PII2
y(6) = 0;      % GlnKUMP
y(7) = 0;      % GlnKUMP2
y(8) = 0;      % GlnKUMP3
y(9) = 0.007;  % GS % http://identifiers.org/ec-code/6.3.1.2
y(10) = 0;     % GSAMP
y(11) = 80;    % GLU % http://identifiers.org/kegg.compound/C00025
y(12) = 2;     % GLN % http://identifiers.org/kegg.compound/C00064
y(13) = 2e-2;  % NHxint % http://identifiers.org/kegg.compound/C01342, http://identifiers.org/kegg.compound/C00014
y(14) = 0.200; % NHxext % http://identifiers.org/kegg.compound/C01342, http://identifiers.org/kegg.compound/C00014
