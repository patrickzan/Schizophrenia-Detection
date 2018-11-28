function f = significance( I, M, period )
% This function computes the significance levels of characteristic
% responses.

IE = sum(I.^2, 1);
IT = sum(IE);
tmin = period(1);
tmax = period(2);
RE = sum(IE(tmin:tmax-1));
f = RE/IT;

end

