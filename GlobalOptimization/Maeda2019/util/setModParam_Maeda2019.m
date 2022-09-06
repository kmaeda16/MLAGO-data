function param = setModParam_Maeda2019(param,x)
% Unit: mM
% x_pred( 1): Kututp    % 2.7.7.59 % 75
% x_pred( 2): Kutippi   % 2.7.7.59 % 13
% x_pred( 3): Kgdhog    % 1.4.1.4  % 26
% x_pred( 4): Kgdhnh    % 1.4.1.4  % 1342
% x_pred( 5): Kgdhglu   % 1.4.1.4  % 25
% x_pred( 6): Kgdhnadph % 1.4.1.4  % 5
% x_pred( 7): Kgdhnadp  % 1.4.1.4  % 6
% x_pred( 8): Kgoggln   % 1.4.1.13 % 64
% x_pred( 9): Kgogog    % 1.4.1.13 % 26
% x_pred(10): Kgognadph % 1.4.1.13 % 5
% x_pred(11): Kgogglu   % 1.4.1.13 % 25
% x_pred(12): Kgognadp  % 1.4.1.13 % 6
% x_pred(13): Kgsatp    % 6.3.1.2  % 2
% x_pred(14): Kgsglu    % 6.3.1.2  % 25
% x_pred(15): Kgsnh     % 6.3.1.2  % 1342
% x_pred(16): Kgsadp    % 6.3.1.2  % 8
% x_pred(17): Kgspi     % 6.3.1.2  % 9
% x_pred(18): Kgsgln    % 6.3.1.2  % 64

index = [ ...
    15, 16, 62, 63, 64, ...
    65, 66, 69, 70, 71, ...
    72, 73, 75, 76, 77, ...
    78, 79, 80 ];

param(index) = x;
