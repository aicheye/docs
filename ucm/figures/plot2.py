import matplotlib.pyplot as plt
from matplotlib.ticker import FuncFormatter
import numpy as np

def best_fit(x, y):
    xbar = sum(x)/len(x)
    ybar = sum(y)/len(y)
    n = len(x) # or len(Y)

    numer = sum([xi*yi for xi,yi in zip(x, y)]) - n * xbar * ybar
    denum = sum([xi**2 for xi in x]) - n * xbar**2

    m = numer / denum
    b = ybar - m * xbar

    rnumer = sum([(xi - xbar) * (yi - ybar) for xi,yi in zip(x, y)])
    rdenum = (sum([(xi - xbar)**2 for xi in x]) * sum([(yi - ybar)**2 for yi in y])) ** (1/2)

    r = rnumer / rdenum

    return m, b, r

f, ax = plt.subplots(1)

def sigs(value, tick_number=0):
    return f"{value:#.3g}"

x = np.array([np.log10(0.410), np.log10(0.520), np.log10(0.600), np.log10(0.710)])
y = np.array([np.log10(0.355150463), np.log10(0.4388266667), np.log10(0.6031237963), np.log10(0.7321396296)])

ax.scatter(x, y)

m, b, r = best_fit(x, y)

yfit = [m * xi + b for xi in x]

ax.plot(x, yfit, label=f"Line of Best Fit (m≈{sigs(m)}, b≈{sigs(b)})")

plt.gca().xaxis.set_major_formatter(FuncFormatter(sigs))
plt.gca().yaxis.set_major_formatter(FuncFormatter(sigs))

ax.set_ylabel("Logarithm of Centripetal Force")
ax.set_xlabel("Logarithm of Radius")

plt.title("Logarithm of Centripetal Force vs. Logarithm of Radius")

plt.legend()

print(f"r: {r}")
print(f"m: {m}")
print(f"b: {b}")

plt.show()
