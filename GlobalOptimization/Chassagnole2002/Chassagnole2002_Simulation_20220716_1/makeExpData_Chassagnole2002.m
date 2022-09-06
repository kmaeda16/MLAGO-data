function funchandle = makeExpData_Chassagnole2002(T,Y,ExpDatafilename)

% Open
fileID = fopen(ExpDatafilename,'w');
if fileID < 0
    error('Could not open %s',ExpDatafilename);
end

% Function name
fprintf(fileID,'function [ T_exp, Y_exp ] = ExpData_Chassagnole2002()\n');
fprintf(fileID,'\n');

[row, col] = size(Y);

% T_exp
fprintf(fileID,'T_exp = [ ...\n');
for i = 1 : row
    fprintf(fileID,'    %e;\n',T(i));
end
fprintf(fileID,'    ];\n');

fprintf(fileID,'\n');

% Y_exp
fprintf(fileID,'Y_exp = [ ...\n');
for i = 1 : row
    fprintf(fileID,'    ');
    for j = 1 : col - 1
        fprintf(fileID,'%.16e, ',Y(i,j));
    end
    j = col;
    fprintf(fileID,'%.16e;\n',Y(i,j));
end
fprintf(fileID,'    ];\n');

fclose(fileID);

[~,name,~] = fileparts(ExpDatafilename);
funchandle = str2func(name);
