% Joel Villarreal
% get the n + 1 cheby shev nodes on the interval [a, b]
function [x] = ChebyShev(n,a,b)

x = ones(n + 1, 1);
for i = 0: 1: n % increment from i = 0, 2, 3, ..., n
    x(i + 1) = 1/2  * (a + b) + 1/2 * (b - a) * cos((i/n) * pi);
end
end
