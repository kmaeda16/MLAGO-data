function funchandle = makeExpData_Maeda2019(T1,Y1,T2,Y2,T3,Y3,ExpDatafilename)

% Open
fileID = fopen(ExpDatafilename,'w');
if fileID < 0
    error('Could not open %s',ExpDatafilename);
end

% Function name
fprintf(fileID,'function [ T_exp, GLU_exp, GLN_exp ] = ExpData_Maeda2019(strain_no)\n');
fprintf(fileID,'\n');

fprintf(fileID,'T_exp   = zeros(14,1);\n');
fprintf(fileID,'GLU_exp = zeros(14,1);\n');
fprintf(fileID,'GLN_exp = zeros(14,1);\n');
fprintf(fileID,'\n');

fprintf(fileID,'switch strain_no\n');
fprintf(fileID,'\n');

comments = { ...
    '% 13-fold upshift--wildtype', ...
    '% 13-fold upshift--deltaGDH', ...
    '% 13-fold upshift--deltaGOGAT'...
    };

T_exp = [ -15, -8, -4, 0, 0.1, 0.2, 0.3, 0.5, 1, 2, 4, 8, 15, 30 ];
for i = 1 : length(comments)
    eval(sprintf('T = T%d;',i));
    eval(sprintf('Y = Y%d;',i));
    fprintf(fileID,'    %s\n',char(comments(i)));
    fprintf(fileID,'    case %d\n',i);
    for j = 1 : length(T_exp)
        if T_exp(j) ~= T(j)
            error('T_exp(%d) = %e, but T(%d) = %e! They need to match!',j,T_exp(j),j,T(j));
        end
        fprintf(fileID,'        T_exp(%d) = %e;   GLU_exp(%d) = %.16e; GLN_exp(%d) = %.16e;\n',j,T(j),j,Y(j,11),j,Y(j,12));
    end
    fprintf(fileID,'\n');
end

fprintf(fileID,'    otherwise\n');
fprintf(fileID,'        error(''Unexpected Strain Number!'');\n');
fprintf(fileID,'\n');

fprintf(fileID,'end\n');

fclose(fileID);

[~,name,~] = fileparts(ExpDatafilename);
funchandle = str2func(name);
