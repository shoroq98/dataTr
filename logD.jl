import Pkg
Pkg.add("LaTeXStrings")
using LaTeXStrings


using PyPlot

close("all"); pygui(true)
h=0.71
DMdensity=0.12/(h)^(2)
RDdensity=10^(-5)
Mpl=2.435*big(10)^27
Ho=10^(-33)
a1 = (9*RDdensity)^(3/4)
a2 = h^2
a3 = Mpl^2
a4 = Ho^(1/2)
k=(a1*a2)/(6 * a3 * a4)

function obj(x)
    result = log( k * (10^x[1])^(1/2) * (10^x[2])^2 )
    if result <= 0.12
        return result
    else
        return NaN
    end
end

nx = 1000
ny = 1000
x = range(-24, -12, length=nx)
y = range(22, 28, length=ny)
ff = zeros(nx, ny)

for i = 1:nx
    for j = 1:ny
        #print(obj([x[i], y[j]]))
        ff[i, j] = obj([x[i], y[j]])
        #print('\n')
    end
end


contour(x, y, ff',10000)

colorbar(label=L"log(Ω_{a} h^2)")

xlabel(L"log(m_{a})(ev)")
ylabel(L"log(f_{a})(ev)")



