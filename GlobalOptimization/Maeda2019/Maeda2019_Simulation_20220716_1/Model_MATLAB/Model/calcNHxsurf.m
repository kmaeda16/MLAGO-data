function [ NHxsurf, vdb_tmp, vamtb_tmp, vdiff_tmp ] = calcNHxsurf( ...
    NHxext, NHxint, Hext, Hint, Ka, ...
    Vamtb_app, Kamtbnh, phi, kdiff, kdb )

% This function calculates NHxsurf while assuming vdb = vamtb + vdiff

k1 = Hext / (Ka + Hext);
k2 = Hint / (Ka + Hint);
k3 = Ka / (Ka + Hext);
k4 = Ka / (Ka + Hint);
k5 = k2 * NHxint / phi;
k6 = kdb * NHxext + kdiff * k4 * NHxint;
k7 = kdb + kdiff * k3;
k8 = Vamtb_app * k1;
k9 = Vamtb_app * k5;

a = k1 * k7;
b = k7 * Kamtbnh - k1 * k6 + k8;
c = - k6 * Kamtbnh - k9;

NHxsurf1 = ( - b + RPowerR(b*b-4*a*c,0.5) ) / (2*a); % Positive Solution
% NHxsurf1 = ( - b - RPowerR(b*b-4*a*c,0.5) ) / (2*a); % Negative Solution

NHxsurf2 = c / a / ( ( - b - RPowerR(b*b-4*a*c,0.5) ) / (2*a) ); % Positive Solution
% NHxsurf2 = c / a / ( ( - b + RPowerR(b*b-4*a*c,0.5) ) / (2*a) ); % Negative Solution

NHxsurf = NHxsurf1;
vdb1 = kdb * (NHxext - NHxsurf);
vamtb1 = ( k8 * NHxsurf - k9 ) / ( Kamtbnh + k1 * NHxsurf );
vdiff1 = kdiff * ( k3 * NHxsurf - k4 * NHxint );

NHxsurf = NHxsurf2;
vdb2 = kdb * (NHxext - NHxsurf);
vamtb2 = ( k8 * NHxsurf - k9 ) / ( Kamtbnh + k1 * NHxsurf );
vdiff2 = kdiff * ( k3 * NHxsurf - k4 * NHxint );

if abs(vdb1-vamtb1-vdiff1) < abs(vdb2-vamtb2-vdiff2)
    NHxsurf = NHxsurf1;
    vdb_tmp = vdb1;
    vamtb_tmp = vamtb1;
    vdiff_tmp = vdiff1;
else
    NHxsurf = NHxsurf2;
    vdb_tmp = vdb2;
    vamtb_tmp = vamtb2;
    vdiff_tmp = vdiff2;
end
