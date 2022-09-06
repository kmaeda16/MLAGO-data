% This script runs the refined active transporter model and makes Figures 3 - 6

diary('RunMe_diary.txt'); % Save diary
tic

cd('ExecScript');

fprintf('Making Figure 3 ...\n');
Run_Yuan;

fprintf('Making Figure 4 ...\n');
Run_Kim;

fprintf('Making Figure 5 ...\n');
Run_Radchenko;

fprintf('Making Figure 6 ...\n');
Run_Kim_VirtualMutant;

cd('..');

toc
diary off;
