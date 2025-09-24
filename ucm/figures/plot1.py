import matplotlib.pyplot as plt
from matplotlib.ticker import FuncFormatter
import numpy as np

f, ax = plt.subplots(1)

def sigs(value, tick_number):
    return f"{value:#.3g}"

x = np.array([0.00, 1/(0.528**2)])
y = np.array([0.00, 0.13 * 9.81])

ax.plot(x, y, label="r=0.410m")

x = np.array([0.00, 1/(0.587**2)])
y = np.array([0.00, 0.13 * 9.81])

ax.plot(x, y, label="r=0.520m")

x = np.array([0.00, 1/(0.688**2)])
y = np.array([0.00, 0.13 * 9.81])

ax.plot(x, y, label="r=0.600m")

x = np.array([0.00, 1/(0.758**2)])
y = np.array([0.00, 0.13 * 9.81])

ax.plot(x, y, label="r=0.710m")

x = np.array([1.00, 1.00])
y = np.array([0.00, 0.13 * 9.81])

ax.plot(x, y, color="gray", linestyle="dashed")

plt.gca().xaxis.set_major_formatter(FuncFormatter(sigs))
plt.gca().yaxis.set_major_formatter(FuncFormatter(sigs))

ax.set_ylim(ymin=0)
ax.set_xlim(xmin=0)

ax.set_ylabel("Centripetal Force (N)")
ax.set_xlabel("Frequency Squared (hz²)")

plt.legend()

plt.title("Centripetal Force vs. Frequency Squared at Various Radii")

plt.show()
