#import "@preview/ilm:1.4.1": *
#import "defs.typ"
#import "formulae.typ"
#import "work.typ"

#set text(lang: "en")
#set math.equation(numbering: none)

#show figure.where(kind: table): set figure.caption(position: top)

#let frame() = (x, y) => (
  top: if y <= 1 { 1pt } else { 0pt },
  bottom: 1pt,
)

#let numbered_eq(content) = math.equation(
  block: true,
  numbering: "(1)",
  supplement: none,
  align(center, content),
)

#show ref: it => {
  if it.element != none and it.element.func() == math.equation {
    link(it.target)[Equation (#it)]
  } else {
    it
  }
}

#let mfc = counter("mfc")

#set footnote(numbering: n => context { n - mfc.get().at(0) })

#show math.equation: it => {
  set footnote(numbering: n => context {[#sym.dagger] * (mfc.get().at(0) + 1) })
  show footnote: it => {
    it
    mfc.step()
  }
  it
}

#show: ilm.with(
  title: [Uniform Circular Motion: Investigating Centripetal Force, Radius, Period, and Frequency],
  author: "Sean Yang",
  date: datetime(year: 2025, month: 03, day: 18),
  abstract: [
    Lab Partners: Eddie Qu, Wen Zheng Dong \
    Mr. Kanowitz, SPH4U1-23
  ],
  appendix: (
    enabled: true,
    body: [#defs#formulae#work],
  ),
  listing-index: (enabled: true),
  figure-index: (enabled: true),
  table-index: (enabled: true),
)

= Introduction
== Purpose
This report seeks to examine the effect of centripetal force on variables essential to uniform circular motion.

== Question
What is the relationship between centripetal force and:
+ radius?
+ period?
+ frequency?

== Hypothesis <hyp>
Based on the following accepted formulae#footnote[For definitions of symbols, please refer to #link(<defs>)[Appendix A]]:

#align(center, [
  $F_c = frac(m v^2, r)$

  $v = frac(2 pi r, T)=2 pi r f$
])

It is derived that:

#numbered_eq($F_c = frac(4 pi^2 m r, T^2)= 4 pi^2 m r f^2$) <eq1>

Therefore, it is implicated that:
+ Centripetal force and radius are directly proportional ($F_c prop r$)
+ Centripetal force and the square of period are inversely proportional ($F_c prop 1/T^2$)
+ Centripetal force and the square of frequency are directly proportional ($F_c prop f^2$)

= Variables
== Part A (Period & Radius)
Manipulated variable: 
- Radius of the path of circular motion ($r$)

Responding variable: 
- Period ($T$)

Control variables:
- Centripetal force ($F_c$)
- Mass of the object experiencing uniform circular motion ($#[m]$)

== Part B (Period & Centripetal Force)
Manipulated variable: 
- Centripetal force ($F_c$)

Responding variable: 
- Period ($T$)

Control variables:
- Radius of the path of circular motion ($r$)
- Mass of the object experiencing uniform circular motion ($#[m]$)

= Equipment and Materials
- Rubber stopper
- String (fishing line)
  - At least one meter
- Hollow tube
- Paperclip
- Masking tape
- Meter stick
- Timer
- Set of various hooked masses
  - 130 grams, 110 grams, 90 grams, 70 grams
- Digital balance

== Setup
#figure(
  [#image("setup.svg", width: 60%)], 
  caption: [Experimental Setup]
) <fig1>

= Procedure
== Preparation <prep>
+ The rubber stopper was weighed on the balance and the mass was recorded.
+ Approximately 1 meter of string was measured and cut.
+ A rubber stopper was tied to one end of the string.
+ The other end of the string was threaded through the hollow tube.
+ The desired radius was measured as shown in @fig1. The tube was fixed in place to mark this length.
+ A paperclip was taped securely to the string at the other end of the tube.
+ The desired hanging mass was tied to the loose end of the string.

== Trial <trial>
+ For each trial, steps 5--7 in @prep were repeated.
+ The hollow tube was held in one hand and the hanging mass in the other. The apparatus was then slowly lifted.
+ Begin twirling the rubber stopper horizontally. Keep the hanging mass stationary.
+ Slowly release the hanging mass, maintaining a constant speed.
+ If the paperclip is too low, rotate faster.
+ If the paperclip is touching the tube, rotate slower.
+ Once the paperclip is just below the hollow tube, maintain a constant speed.
+ Time and record how long it takes to complete ten revolutions.

= Observations
== Qualitative Observations <qualia>
It was difficult to maintain the paperclip at a consistent level. Often, the paperclip would become stuck and not respond as expected to changes in speed. 

It was also noted that it was difficult to maintain the rotation on a flat horizontal plane. The stopper's axis of rotation often tilted, and the stopper's plane of rotation tended to be below the top of the tube.

== Quantitative Observations
For all eight trials in #link(<part1>)[Part A] and #link(<part2>)[Part B], an identical stopper was used, with a mass of 32.9g.

=== Part A (Period & Radius) <part1>
Four trials were conducted, starting with the radius at 40cm and increasing by approximately 10cm each trial. For all trials, the hanging mass was 130g.

#let table1 = table(
  columns: 7,
  stroke: frame(),

  table.header[\#][$r$ ($#[m]$)][$m_#[stopper]$ ($#[kg]$)][$m_#[hanging]$ ($#[kg]$)][$T#footnote[Calculated by dividing the time recorded on the timer by 10]$ ($#[s]$)][$f#footnote[Reciprocal of $T$]$ ($#[Hz]$)][$f^2$ ($#[Hz]^2$)],

  [1], [$0.410$], [$0.0329$], [$0.130$], [$0.528$], [$1.89$], [$3.59$],
  [2], [$0.520$], [$0.0329$], [$0.130$], [$0.587$], [$1.70$], [$2.91$],
  [3], [$0.600$], [$0.0329$], [$0.130$], [$0.688$], [$1.45$], [$2.11$],
  [4], [$0.710$], [$0.0329$], [$0.130$], [$0.758$], [$1.32$], [$1.74$]
)

#figure(table1, caption: [Data Recorded in #link(<part1>)[Part A]])
<tab1>

=== Part B (Period & Centripetal Force) <part2>
Four trials were conducted, with the hanging mass at 130g and decreasing by 20g each trial. For all trials, the radius was 50cm.

#let table2 = table(
  columns: 7,
  stroke: frame(),

  table.header[\#][$r$ ($#[m]$)][$m_#[stopper]$ ($#[kg]$)][$m_#[hanging]$ ($#[kg]$)][$T$#super[#sym.dagger] ($#[s]$)][$f$#super[#sym.dagger#sym.dagger] ($#[Hz]$)][$f^2$ ($#[Hz]^2$)],

  [5], [$0.500$], [$0.0329$], [$0.130$], [$0.736$], [$1.36$], [$1.85$],
  [6], [$0.500$], [$0.0329$], [$0.110$], [$0.749$], [$1.34$], [$1.78$],
  [7], [$0.500$], [$0.0329$], [$0.090$], [$0.780$], [$1.28$], [$1.64$],
  [8], [$0.500$], [$0.0329$], [$0.070$], [$0.809$], [$1.24$], [$1.53$]
)


#figure(table2, caption: [Data Recorded in #link(<part2>)[Part B]])
<tab2>

= Analysis <anal>
== Initial Assumptions <assume>
For the purpose of simplicity for later calculations, it is assumed that:
- Friction is negligible
- Air resistance is negligible
- The string is massless, inelastic, and flexible (tension at every point is constant)
- The force of gravity acting on the stopper is negligible in comparison to the tension of the string

The validity of these assumptions will be discussed in @eval.

For all equations, assume that:
- $#[up] = plus.circle$, $#[down] = dash.circle$
- $#[centripetal] = plus.circle$, $#[centrifugal] = dash.circle$

== Forces Involved <forces>
As illustrated in @fig2, the only forces acting on the hanging mass are the force of tension on the string and the force of gravity, and these forces oppose each other.

#figure(
  [#image("fbd1.svg", height: 20%)],
  caption: [Free body diagram of the hanging mass]
) <fig2>

#align(center, [
  $F_#[net] = F_T - F_(g 1)$
])

Since the paperclip was kept at a constant level, it is therefore necessary that:

#align(center, [$F_#[net] = 0N$])

Thus,

#align(center, [
  $0 = F_T - F_(g 1)$
])

#numbered_eq($F_T = F_(g 1)$) <eq2>

#pagebreak()

As illustrated in @fig3, the only force acting on the stopper is the force of tension (recall that it was assumed that the force of gravity is negligible in @assume). Thus, this is also the net force.

#figure(
  [#image("fbd2.svg", width: 20%)],
  caption: [Free body diagram of the rotating stopper]
) <fig3>

#align(center, [
  $F_#[net] = F_T$
])

Since the stopper is undergoing uniform circular motion, the net force must also be the centripetal force.

#align(center, [
  $F_#[net] = F_c$
])

#numbered_eq($F_T = F_c$) <eq3>

Substituting @eq2 into @eq3:

#numbered_eq($F_c = F_(g 1)$) <eq4>

Therefore, the magnitude of the centripetal force is equal to the magnitude of the weight of the hanging mass.

== Part A (Period & Radius) <part1anal>
In all trials conducted in #link(<part1>)[Part A], the hanging mass was 130g. Thus, $F_c approx 1.28#[N]$ for all trials#footnote[See #link(<work1>)[Appendix C.1.] for calculations.].

It is intuitive that when $f=0#[Hz]$, $F_c=0N$ (no force at all). Thus, a graph can be plotted for all datapoints in @tab1, drawing a line from the origin, as illustrated in @plot1.

#figure(
  [#image("plot1.svg", width: 90%)],
  caption: [Centripetal Force vs. Frequency Squared at Various Radii]
) <plot1>

A vertical is then drawn at at 1.00hz#super([2]). By reading vertically across each line plotted, the centripetal force for a constant $f^2$ at each corresponding radius was determined:

#let table3 = table(
  columns: 5,
  stroke: frame(),
  table.header[\#][$m_#[stopper]$ ($#[kg]$)][$f^2$ ($#[Hz]^2$)][$r$ ($#[m]$)][$F_c$ ($#[N]$)],

  [1], [$0.0329$], [$1.00$], [$0.410$], [$0.355$],
  [2], [$0.0329$], [$1.00$], [$0.520$], [$0.439$],
  [3], [$0.0329$], [$1.00$], [$0.600$], [$0.603$],
  [4], [$0.0329$], [$1.00$], [$0.710$], [$0.732$],
)

#figure(table3, caption: [Extrapolated Centripetal Forces at Various Radii]) <tab3>

Next, the log-linearization technique can be applied on @eq1:

#align(center, math.equation[
  $F_c &=&& 4 pi^2 m r f^2$ \
  $log(F_c) &=&& log(4 pi^2 m r f^2)$ \
  $log(F_c) &=&& log(r) + log(4 pi^2 m f^2)$ \
])

Substituting $m = 0.0329#[kg]$ and $f^2=1.00#[Hz]^2$ into the above equation yields:#footnote[See #link(<work2>)[Appendix C.2.] for calculations.]

#align(center, math.equation[
  $log(F_c) approx log(r) - log(1.30#[N]/#[m])$ \
])

The remainder of this section will produce an equivalent experimental formula in the form:

#align(center, math.equation[$log(F_c) &approx&& n_1log(r) + log(k_1)$])

Ideally, $n_1 = 1$ and $k_1 = 1.30#[N]/#[m]$

First, by taking the logarithm of values @tab3, the following table was produced:

#let table0 = table(
  columns: 5,
  stroke: frame(),
  table.header[\#][$m_#[stopper]$ ($#[kg]$)][$f^2$ ($#[Hz]^2$)][$log(r)$][$log(F_c)$],

  [1], [$0.0329$], [$1.00$], [$-0.387$], [$-0.450$],
  [2], [$0.0329$], [$1.00$], [$-0.284$], [$-0.358$],
  [3], [$0.0329$], [$1.00$], [$-0.222$], [$-0.220$],
  [4], [$0.0329$], [$1.00$], [$-0.149$], [$-0.135$],
)

#figure(table0, caption: [Extrapolated Centripetal Forces at Various Radii (Logarithms)]) <tab0>

#pagebreak()

The data from @tab0 has been plotted below in @plot2. An $r$-value#footnote[Pearson's correlation coefficient. For the formula, please see #link(<formulae>)[Appendix B].] of $0.985$ indicates a very strong positive correlation between these two variables.

#figure(
  [#image("plot2.svg", width: 90%)],
  caption: [Logarithm of Centripetal Force vs. Logarithm Radius ($r approx 0.985$)]
) <plot2>

$n_1$ is simply the slope in the line of best fit in @plot2 and $k_1$ can be calculated as the antilogarithm of the y-intercept, since the relationship between $log(F_c)$ and $log(r)$ is linear:

#align(center, math.equation[
  $log(k_1) &approx&& 0.065388416$ \
  $k_1 &approx&& 10^0.065388416$ \
  $k_1 &approx&& 1.16 #[N]/#[m]$
])

The following experimental equation for centripetal force arises:

#align(center, math.equation[
  $log(F_c) approx 1.37log(r) - log(1.16#[N]/#[m])$
])

The error in $n_1$ is $37.0%$ (by inspection), and the error in $k_1$ is about $10.5%$, which is within experimental error.#footnote[See #link(<work3>)[Appendix C.3.] for calculations.]

#pagebreak()

== Part B (Period & Centripetal Force) <part2anal>
Using the conclusion reached from @forces, the following table can be produced by calculating the centripetal force for each trial from @part2:#footnote[See #link(<work4>)[Appendix C.4.] for calculations.]

#let table4 = table(
  columns: 6,
  stroke: frame(),

  table.header[\#][$F_c$ ($#[N]$)][$r$ ($#[m]$)][$m_#[stopper]$ ($#[kg]$)][$T$ ($#[s]$)][$f$ ($#[Hz]$)],

  [5], [$1.28$], [$0.500$], [$0.0329$], [$0.736$], [$1.36$],
  [6], [$1.08$], [$0.500$], [$0.0329$], [$0.749$], [$1.34$],
  [7], [$0.883$], [$0.500$], [$0.0329$], [$0.780$], [$1.28$],
  [8], [$0.687$], [$0.500$], [$0.0329$], [$0.809$], [$1.24$],
)

#figure(
  table4,
  caption: [Data Recorded in #link(<part1>)[Part B] (Centripetal Force)]
) <tab4>

=== Relationship Between Centripetal Force & Period <part2anal1>
@eq1 from @hyp hints that this relationship is likely not linear. The log-linearization technique can be applied to analyze this relationship as if it were linear:

#align(center, math.equation[
  $F_c &=&& frac(4 pi^2 m r, T^2)$ \
  $F_c &=&& (4 pi^2 m r) T^(-2)$ \
  $log(F_c) &=&& log((4 pi^2 m r) T^(-2))$ \
  $log(F_c) &=&& log(4 pi^2 m r ) + log(T^(-2))$ \
  $log(F_c) &=&& -2log(T) + log(4 pi^2 m r)$ \
])

Substitute $m=0.0329#[kg]$:

#align(center, math.equation[
  $log(F_c) &approx&& -2log(T) + log(4 pi^2 (0.0329#[kg]) r)$ \
  $log(F_c) &approx&& -2log(T) + log((1.30#[kg])r)$
])

The goal of the following analysis is to produce a formula in the form:

#align(center, [$log(F_c) approx n_2 log(T) + log(k_2 r^(n_2))$])

To compare with this theoretical equation. Theoretically, $n_2=-2$ and $k_2=1.30#[kg]$.

By simply taking the log of $F_c$ and $T$ from @tab4, the following table is obtained:

#let table5 = table(
  columns: 5,
  stroke: frame(),

  table.header[\#][$log(F_c)$][$r$ ($#[m]$)][$m_#[stopper]$ ($#[kg]$)][$log(T)$],

  [5], [$0.106$], [$0.500$], [$0.0329$], [$-0.133$],
  [6], [$0.033$], [$0.500$], [$0.0329$], [$-0.126$],
  [7], [$-0.054$], [$0.500$], [$0.0329$], [$-0.108$],
  [8], [$-0.163$], [$0.500$], [$0.0329$], [$-0.092$],
)

#figure(
  table5,
  caption: [Data Recorded in #link(<part1>)[Part B] ($F_c$ and $T$), Logarithms]
) <tab5>

#pagebreak()

The following scatter plot and line of best fit can be generated from the data in @tab5:

#figure(
  [#image("plot3.svg", width: 80%)],
  caption: [Logarithm of Centripetal Force vs. Logarithm of Period ($r=-0.995$)]
) <plot3>

Visually, the data displays a strong negative correlation. The $r$-value of $-0.995$ indicates an almost exact linear correlation.

Using the y-intercept, we can calculate $k$ since $r=0.500#[m]$ and $n_1 approx 1.37$ from @part1anal:

#align(center, math.equation[
  $log(k_2 r^(n_1)) &=&& -0.738113824$ \
  $k_2 (0.500#[m]^1.366714833) &=&& 10^(-0.738113824)$ \
  $k_2 &=&& 0.182762115/0.38777243 $ \
  $&approx&& 0.471 #[kg]$
])

$n_2$ is simply the slope of the line of best fit in @plot3 (about $-6.27$). 

The experimental results can now be represented in the log-linearized form of the exponential equation $F_c = k_2 r^(n_1) T^(n_2)$:

#numbered_eq($log(F_c) approx -6.27log(T) + log((0.471#[kg]) r^1.37)$)

Both $n_2$ and $k_2$ show high levels of deviation from the theoretical values, at $213%$ and $63.7%$, respectively.#footnote[See #link(<work5>)[Appendix C.5.] and #link(<work6>)[Appendix C.6.] for calculations.]

#pagebreak()

=== Relationship Between Centripetal Force & Frequency <part2anal2>
Many techniques used in this section will be similar to techniques used in @part2anal1. Applying log-linearization, the following relationship is obtained between $log(F_c)$ and $log(f)$:

#align(center, math.equation[
  $F_c &=&& 4 pi^2 m r f^2$ \
  $log(F_c) &=&& log((4 pi^2 m r) f^2)$ \
  $log(F_c) &=&& log(4 pi^2 m r ) + log(f^2)$ \
  $log(F_c) &=&& 2log(f) + log(4 pi^2 m r)$
])

Substitute $m=0.0329#[kg]$:

#align(center, math.equation[
  $log(F_c) &approx&& 2log(f) + log(4 pi^2 (0.0329#[kg]) r)$ \
  $log(F_c) &approx&& 2log(f) + log((1.30#[kg])r)$
])

The goal of the following analysis is to produce a respective formula in the form:

#align(center, [$log(F_c) approx n_3 log(f) + log(k_2 r^(n_1))$])

Theoretically, $n_3 = 2$ and $k_2 = 1.30#[kg]$.

First, by taking the log of $F_c$ and $f$ from @tab4, the following table is obtained:#footnote[The values for $log(f)$ are just the negatives of $log(T)$, since $f$ is just the reciprocal of $T$.]

#let table6 = table(
  columns: 5,
  stroke: frame(),

  table.header[\#][$log(F_c)$][$r$ ($#[m]$)][$m_#[stopper]$ ($#[kg]$)][$log(f)$],

  [5], [$0.106$], [$0.500$], [$0.0329$], [$0.133$],
  [6], [$0.033$], [$0.500$], [$0.0329$], [$0.126$],
  [7], [$-0.054$], [$0.500$], [$0.0329$], [$0.108$],
  [8], [$-0.163$], [$0.500$], [$0.0329$], [$0.092$],
)

#figure(
  table6,
  caption: [Data Recorded in #link(<part1>)[Part B] ($F_c$ and $f$), Logarithms]
) <tab6>

#pagebreak()

Using data from @tab6, the below plot was be produced:

#figure(
  [#image("plot4.svg", width: 80%)],
  caption: [Logarithm of Centripetal Force vs. Logarithm of Frequency ($r=0.995$)]
) <plot4>

An $r$-value of $0.995$ indicates a very strong positive correlation between frequency and centripetal force. 

Note that the values for slope ($~6.27$) and $r$ are both the negatives of the values found in @plot3. This is expected, given that frequency is the reciprocal of period, and taking the reciprocal is equivalent to raising a value to the -1#super[st] power.

The y-intercept of the line of best fit is also identical, which is also expected based on the nature of log-linearization. The y-intercept represents the coefficient, which remains constant at $4 pi^2 m$ for both $T$ and $f$, as in @eq1.

Since the y-intercept is identical, $k_2$ must also be identical to the $k_2$ found in @part2anal1 (about $0.471#[kg]$).

$n_3$ is simply the slope of the line of best fit in @plot4 (about $6.27$).

The log-linearized formula for $F_c$ vs. $f$ is therefore:

#numbered_eq($log(F_c) approx 6.27log(f) + log((0.471#[kg ])r^1.37)$) <eq8>

However, this also means that the errors for $n_3$ and $k_2$ are equally as high as in @part2anal1, at $213%$ and $63.7%$, respectively.#footnote[See #link(<work7>)[Appendix C.7.] and #link(<work6>)[Appendix C.6], respectively, for calculations.]

= Evaluation <eval>
== Application to a Theoretical Situation <app>
Using these results, it is possible to extrapolate the centripetal force required to rotate the rubber stopper where $r=1.5#[m]$ and $f=8.0#[Hz]$.

@eq8 was derived in @part2anal2:

#align(center, [$log(F_c) approx 6.27log(f) + log ((0.471#[kg])r^1.37)$])

Substitute $r = 1.5#[m]$ and $f=8.0#[Hz]$ into @eq8:

#align(center, math.equation[
  $log(F_c) &approx&& 6.266518067log(f) - log(0.471311825#[kg] times r^1.366714833)$ \
  $log(F_c) &approx&& 6.266518067log(8.0#[Hz]) - log(0.471311825#[kg] times 1.5#[m]^1.366714833)$ \
  $log(F_c) &approx&& 6.266518067log(8) - log(0.82030408)$ \
  $log(F_c) &approx&& 5.65802193 + 0.086025128$ \
  $F_c &approx&& 10^5.744047058$ \
  $F_c &approx&& 5.55 times 10^5#[N]$
])

Clearly, this value is outlandishly high, likely due to the experimental exponent being $6.27$. As discussed, this is much higher than the theoretical exponent of $2$, meaning that the experimental results expect $F_c$ to grow at a much higher rate.

== Sources of Error
Relevant equations:
#numbered_eq($F_c approx k_1 r^(n_1) #[, from @part1anal]$) <eq10>
#numbered_eq($F_c approx k_2 r^(n_1) T^(n_2) #[, from @part2anal1]$) <eq11>
#numbered_eq($F_c approx k_2 r^(n_1) f^(n_3) #[, from @part2anal2]$) <eq12>

The below table summarizes errors found in @anal for relevant parameters:

#figure(table(
  columns: 5,
  stroke: frame(),

  table.header[Parameter][Description][Theoretical][Actual][Error],

  [$n_1$], [Exponent on $r$ in #link(<eq10>)[Eqn. (7)]], [$1$], [$1.37$], [$37.0%$],
  [$k_1$], [Coefficient of $r^(n_1)$ in #link(<eq10>)[Eqn. (8)]], [$1.30$], [$1.16$], [$10.5%$],
  [$n_2$], [Exponent on $T$ in #link(<eq11>)[Eqn. (9)]], [$2$], [$6.27$], [$213%$],
  [$k_2$], [Coefficient of $r^(n_1)T^(n_2)$ in #link(<eq11>)[Eqn. (9)]], [], [], [$63.7%$],
  [$n_3$], [Exponent on $f$ #link(<eq12>)[Eqn. (10)]], [], [], [$213%$],
), caption: [Summary of Errors])

There are likely several factors which contributed to the high level of error seen in this report. The remainder of this section will attempt to address the most exorbitant sources and suggest solutions to mitigate this error.

=== Issues with Assumptions
A number of assumptions were made in @assume to reduce the complexity of calculations. The two that most likely contributed most to the error observed were neglecting friction and neglecting the force of gravity on the stopper.

As noted in @qualia, it was observed that the paperclip would occasionally not respond to changes in speed. This is undoubtedly due to the friction experienced by the string on the tube. 

To mitigate this effect, it may be preferable to spin at slower speeds to minimize the centripetal force and thus the reaction force of the tube on the fishing line.

Furthermore, it may not be acceptable to consider the force of gravity on the stopper as negligible. Given a mass of $0.0329#[kg]$, $F_(g#[ stopper]) = (0.0329#[kg])(9.81#[m]/#[s]^2) approx 0.323#[N]$. 

This is in fact extremely significant, especially when compared to the assumed centrifugal forces calculated in @anal, being as much as $47.0%$ of the centripetal force in the case of trial 8.#footnote[Calculations: $frac(0.322749#[N], 0.6867#[N]) times 100% = 0.47 times 100% = 47.0%$.]

When drawing the free body diagram for the stopper considering gravity, it becomes clear why this is significant:

#figure(
  [#image("fbd3.svg", width: 30%)],
  caption: [Free body diagram of the stopper, considering gravity]
)

This free body diagram matches observations in @qualia, where it was noted the stopper would rarely be at the same level as the tube.

Clearly, some tension (resulting from the weight of the hanging mass) must counteract the weight of the stopper to prevent it from falling. 

Specifically, 

#align(center, math.equation[
  $F_c &=&& F_#[net x]$ \
  $F_c &=&& F_T cos theta$
])

This contradicts @eq3, which claims that $F_c = F_T$.

The error between these two interpretations of $F_c$ grows with larger values of $theta$.

Thus, our previous analysis has likely vastly overestimated the centrifugal force acting on the stopper. To account for this inaccuracy, @eq3 and @eq4 should be replaced with more accurate equations.

Alternatively, it may be possible use a lighter stopper or a heavier hanging mass in order to make the weight of the stopper much more smaller relative to the weight of the hanging mass. 

This arises from the small angle approximation for cosine. 

When $F_T = F_(g_1) >> F_(g 2)$, tension has to compensate less for the weight of the stopper, and $theta$ becomes very small. The small angle approximation tells us that $cos theta approx 1$ and that therefore $F_c approx F_c cos theta$ when $F_(g 1) >> F_(g 2)$.

=== Timing
While timing, group members noticed the difficulty associated with accurately starting and stopping the timer during the proper intervals.

Especially given the small time scales on which this experiment depends, small errors in timing can result in large discrepancies in experimental results.

Instead of only timing ten revolutions as described in @trial, it may be better to time twenty or even larger numbers of revolutions and to have multiple timers to verify each other's times.

= Findings
Given the strong positive correlations ($r > 0.95$) seen in @plot2 and @plot4, in conjunction with the strong negative correlations ($r < -0.95$) seen in @plot3, the following proportionality statements can be reasonably made:

1. $F_c prop r$
2. $F_c prop 1/T^n$
3. $F_c prop f^n$

Where $n in ZZ_+$

These conclusions partially verify the hypotheses made in @hyp. 

However, more work needs to be done to verify the value of $n$, which should theoretically be $2$, and eliminate the y-intercept errors.

Overall, some general conclusions about the relationship between variables in centripetal force can be made. However, given the high error values $>200%$ found in @part2anal as well as the relatively high magnitude of y-intercept found in @part1anal, this report has unfortunately failed to fully verify the theoretical equations for centripetal force.
