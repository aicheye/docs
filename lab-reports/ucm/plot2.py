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

x = np.array([0.410, 0.520, 0.600, 0.710])
y = np.array([0.355150463, 0.4388266667, 0.6031237963, 0.7321396296])

ax.scatter(x, y)

m, b, r = best_fit(x, y)

yfit = [m * xi + b for xi in x]

ax.plot(x, yfit, label=f"Line of Best Fit (m≈{sigs(m)}N/m, b≈{sigs(b)}N/m)")

plt.gca().xaxis.set_major_formatter(FuncFormatter(sigs))
plt.gca().yaxis.set_major_formatter(FuncFormatter(sigs))

ax.set_ylabel("Centripetal Force (N)")
ax.set_xlabel("Radius (m)")

plt.title("Centripetal Force vs. Radius")

plt.legend()

print(f"r: {r}")
print(f"m: {m}")
print(f"b: {b}")

plt.show()
