import matplotlib.pyplot as plt
from matplotlib.ticker import FuncFormatter
import numpy as np

f, ax = plt.subplots(1)

def sigs(value, tick_number=0):
    return f"{value:#.3g}"

x = np.array([0.410, 0.520, 0.600, 0.710])
y = np.array([0.355150463, 0.4388266667, 0.6031237963, 0.7321396296])

ax.scatter(x, y)

plt.gca().xaxis.set_major_formatter(FuncFormatter(sigs))
plt.gca().yaxis.set_major_formatter(FuncFormatter(sigs))

ax.set_ylabel("Centripetal Force (N)")
ax.set_xlabel("Radius (m)")

plt.title("Centripetal Force vs. Radius")

plt.legend()

plt.show()
