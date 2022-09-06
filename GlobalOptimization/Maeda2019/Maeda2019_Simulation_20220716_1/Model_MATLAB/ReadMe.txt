
****************
  Model_MATLAB
****************

This directory contains MATLAB codes to simulate the E. coli ammonium transport and assimilation network (the refined active transporter model) and make plots of the article "Ranking network mechanisms by how they fit diverse experiments and deciding on E. coli's ammonium transport and assimilation network".


License:

The MATLAB codes are distributed under GNU General Public License v3.0.


Requirements:

KM used MATLAB R2016a on Windows 10, but the codes will work on other environments. For older versions of MATLAB, lines and symbols in plots might be different in color. 


Usage:

1. Unzip "Model_MATLAB.zip".
2. Run "RunMe.m" on MATLAB. The calculation takes a few minutes.
3. Figures 3 - 6 automatically pop up.
4. If you would like to check initial conditions and parameter values, uncomment the line with "printParamValues" in ExecScripts/Run_*.m and Util/runSimulation_Kim.m


Citation:

Kazuhiro Maeda, Hans V. Westerhoff*, Hiroyuki Kurata*, Fred C. Boogerd, Ranking network mechanisms by how they fit diverse experiments and deciding on E. coli's ammonium transport and assimilation network, npj Systems Biology and Applications, 2019. *Corresponding Authors


Any suggestions and bug reports are welcome. Please contact KM.


-------------------------------
Kazuhiro Maeda
Kyushu Institute of Technology
