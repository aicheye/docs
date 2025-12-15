
#set page(width: 8.5in, height: 11in, margin: 0.25in, columns: 2)

#place(
  top + center,
  scope: "parent",
  float: true,
  text(1.4em)[
    *CHE 102 Final Reference Sheet* - Sean Yang
  ],
)

== Temperature Conversion Factors
$(1"K")/(1.8"°R")$, $(1"K")/(1.8"°F")$, $(1"°C")/(1.8"°F")$, $(1"°C")/(1.8"°R")$, $(1"°C")/(1"K")$, $(1"°F")/(1"°R")$

(Relative differences only)

== Density
$rho = frac(m, v)$

== Mole Fraction and Percentage
$x_A = n_a / n_T = n_A / (sum_i n_i)$

$% = x_A times 100\%$

== Mass Fraction and Percentage
$w_A = m_A / m_T = m_A / (sum_i m_i)$

$% = w_A times 100\%$

== Average Molar Mass
$M = sum_i x_i M_i$

== Percentage Yield and Excess
$"% yield" = "actual" / "theoretical" times 100%$

$"% excess" = ("amount provided" - "amount required") / "amount required" times 100%$

== Boyle's Law (Constant n, T)
$P ∝ frac(1, v)$

$P_1 V_1 = P_2 V_2$

== Charles' Law (Constant n, P)
$V ∝ T$

$V_1/T_1 = V_2/T_2$

Temperature in K

== Avogadro's Law (Constant T, P)
$V ∝ n$

$V_1/n_1 = V_2/n_2$

At 0°C and 1 atm: 1 mol gas = 22.414 L

At 25°C and 1 atm: 1 mol gas = 24.465 L

== Ideal Gas Law
$P V = n R T$

Temperature in K

== Ideal Gas Assumptions:
- No intermolecular forces between molecules
- Gas molecules have no volume
Approximation valid at high $T$, low $P$

== Gas Density
$rho = (P M)/(R T)$

at 25°C and 1 atm: $rho = M/(24.465 L dot "mol"^(-1))$

== Gas Concentration
$C = (P)/(R T)$

at 25°C: $C = (P)/(24.465 L dot "atm" dot "mol"^(-1))$, where $P$ is in atm

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

== Kinetic Molecular Theory Postulates
- Gas particles are in constant, random motion
- Collisions between gas particles and container walls are elastic
- The average kinetic energy of gas particles is proportional to temperature in K
- Gas particles exert no forces on each other (no attraction or repulsion)

== Reaction Rate Constant Units
Note: $Q_p$ and $K_p$ should be calculated using bar units for pressure ($1 "bar" = 10^5 "Pa" = 750 "mmHg"$)

#table(
  columns: (auto, auto),
  table.header([Order], [Units of k]),
  "0", $"mol" dot L^(-1) dot s^(-1)$,
  "1", $s^(-1)$,
  "2", $L dot "mol"^(-1) dot s^(-1)$,
  "n", $L^(n-1) dot "mol"^(1-n) dot s^(-1)$,
)

== Kinetic Plots
#table(
  columns: (auto, auto, auto),
  table.header([Order], [Plot of], [Slope]),
  "0", $[A] "vs." t$, $-k$,
  "1", $ln[A] "vs." t$, $-k$,
  "2", $frac(1, [A]) "vs." t$, $k$,
)

== Integrated Rate Laws
Note: Pressure can be used in place of concentration for gases since concentration is proportional to pressure.

#table(
  columns: (auto, auto, auto, auto),
  table.header([Order], [Rate Law], [Integrated Rate Law], [Half-Life]),
  "0", $"rate" = k$, $[A] = [A]_0 - k t$, $t_(1/2) = frac([A]_0, 2 k)$,
  "1", $"rate" = k [A]$, $ln[A] = ln[A]_0 - k t$, $t_(1/2) = frac(ln 2, k)$,
  "2", $"rate" = k [A]^2$, $frac(1, [A]) = frac(1, [A]_0) + k t$, $t_(1/2) = frac(1, k [A]_0)$,
)

== Henry's Law and Raoult's Law Units
$C_A$ = concentration of gas in solution ($"mol"/L$)

$k_A$ = Henry's law constant ($"mol" dot L^(-1) dot "atm"^(-1)$)

$H_A$ = Henry's law constant ($"atm"$)

$P_A$ = partial pressure of gas above solution ($"atm"$)

$x_A$ = mole fraction of solvent in solution

== Nernst Equation at 25°C
$E = E^o - (0.0592/n) log Q$

Where $n$ = number of moles of electrons transferred

$E^o$ = standard cell potential (V)

$Q$ = reaction quotient

== Galvanic cell
#image("galvanic_cell.png")

$"Cu"_"(s)"$ | $"Cu"^(2+)_"(aq)"$ || $"Zn"^(2+)_"(aq)"$ | $"Zn"_("s")$

Anode (oxidation): left side

Cathode (reduction): right side
