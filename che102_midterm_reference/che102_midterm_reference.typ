
#set page(width: 8.5in, height: 11in, margin: 1in, columns: 2)

#place(
  top + center,
  scope: "parent",
  float: true,
  text(1.4em)[
    *CHE 102 Midterm Reference Sheet* - Sean Yang
  ],
)

== SI Prefixes and Conversion
#table(
  columns: (auto, 1fr, auto),
  align: horizon,
  table.header([*Factor*], [*Prefix*], [*Symbol*]),
  [$10^(12)$], [tera], [T],
  [$10^9$], [giga], [G],
  [$10^6$], [mega], [M],
  [$10^3$], [kilo], [k],
  [$10^2$], [hecto], [h],
  [$10^1$], [deca], [da],
  [$10^0$], [unit], [],
  [$10^(-1)$], [deci], [d],
  [$10^(-2)$], [centi], [c],
  [$10^(-3)$], [milli], [m],
  [$10^(-6)$], [micro], [μ],
  [$10^(-9)$], [nano], [n],
  [$10^(-12)$], [pico], [p],
)

== Temperature Conversion Factors
$(1"K")/(1.8"°R")$, $(1"K")/(1.8"°F")$, $(1"°C")/(1.8"°F")$, $(1"°C")/(1.8"°R")$, $(1"°C")/(1"K")$, $(1"°F")/(1"°R")$

(Relative differences only)

== Density
$rho = frac(m, v)$

== Average Atomic Mass
$M = sum_i x_i M_i$

== Mole Fraction and Percentage
$x_A = n_a / n_T = n_A / (sum_i n_i)$

$% = x_A times 100\%$

== Mass Fraction and Percentage
$w_A = m_A / m_T = m_A / (sum_i m_i)$

$% = w_A times 100\%$

== Average Molar Mass
$M = sum_i x_i M_i$

#colbreak()

== Concentration
$"molarity" = n / V$

$"mass %" = m_"solute" / m_"solution" times 100%$

$"volume %" = V_"solute" / V_"solution" times 100%$

$"weight-to-volume %" = m_"solute" / V_"solution" times 100%$

$"molality" = n_"solute" / m_"solvent"$

$"ppm" = m_"solute" / m_"solution" times 10^6$

$"ppb" = m_"solute" / m_"solution" times 10^9$

== Percentage Yield and Excess
$"% yield" = "actual" / "theoretical" times 100%$

$"% excess" = ("amount provided" - "amount required") / "amount required" times 100%$

== Boyle's Law (Constant n, T)
$P ∝ frac(1, v)$

$P_1 V_1 = P_2 V_2$

== Charles' Law (Constant n, P)
$V ∝ T$

$frac(V_1, T_1) = frac(V_2, T_2)$

Temperature in K

== Avogadro's Law (Constant T, P)
$V ∝ n$

$frac(V_1, n_1) = frac(V_2, n_2)$

At 0°C and 1 atm: 1 mol gas = 22.414 L

At 25°C and 1 atm: 1 mol gas = 24.465 L

== Ideal Gas Law
$P V = n R T$

or $P V_m = R T$, where $V_m = frac(V, n)$

Temperature in K

== Ideal Gas Assumptions:
- No intermolecular forces between molecules
- Gas molecules have no volume
Approximation valid at high $T$, low $P$

#pagebreak()

== Gas Density
$rho = frac(P M, R T)$

== Dalton's Law of Partial Pressures
$P = P_A + P_B$

Assuming $V= V_A = V_B$

== Dalton's Law of Partial Volumes
$V = V_A + V_B$

Assuming $P= P_A = P_B$

== Dalton's Law (Mole Fraction)

$y_A = frac(n_A, n) = frac(P_A, P) = frac(V_A, V)$

$n_A = y_A n$

$P_A = y_A P$

$V_A = y_A V$

== Measuring Pressure with an Open-End Manometer
#image("manometer.png")

$Delta P_("mmHg") = Delta h_("Hg")$
