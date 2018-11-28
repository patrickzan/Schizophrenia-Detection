function f = timing( I, M, period )
% This function finds out time points when significant response happens. 

IE = sum(I.^2, 1);
tmin = period(1);
tmax = period(2);
[~, f] = max(IE(tmin:tmax-1));
f = f/M;
end

