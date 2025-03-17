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
- Mass of the object experiencing uniform circular motion ($#text[m]$)

== Part B (Period & Centripetal Force)
Manipulated variable: 
- Centripetal force ($F_c$)

Responding variable: 
- Period ($T$)

Control variables:
- Radius of the path of circular motion ($r$)
- Mass of the object experiencing uniform circular motion ($#text[m]$)

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

  table.header[\#][$r$ ($#text[m]$)][$m_#text[stopper]$ ($#text[kg]$)][$m_#text[hanging]$ ($#text[kg]$)][$T#footnote[Calculated by dividing the time recorded on the timer by 10]$ ($#text[s]$)][$f#footnote[Reciprocal of $T$]$ ($#text[Hz]$)][$f^2$ ($#text[Hz]^2$)],

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

  table.header[\#][$r$ ($#text[m]$)][$m_#text[stopper]$ ($#text[kg]$)][$m_#text[hanging]$ ($#text[kg]$)][$T$#super[#sym.dagger] ($#text[s]$)][$f$#super[#sym.dagger#sym.dagger] ($#text[Hz]$)][$f^2$ ($#text[Hz]^2$)],

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
- $#text[up] = plus.circle$, $#text[down] = dash.circle$
- $#text[centripetal] = plus.circle$, $#text[centrifugal] = dash.circle$

== Forces Involved <forces>
As illustrated in @fig2, the only forces acting on the hanging mass are the force of tension on the string and the force of gravity, and these forces oppose each other.

#figure(
  [#image("fbd1.svg", height: 20%)],
  caption: [Free body diagram of the hanging mass]
) <fig2>

#align(center, [
  $F_#text[net] = F_T - F_(g 1)$
])

Since the paperclip was kept at a constant level, it is therefore necessary that:

#align(center, [$F_#text[net] = 0N$])

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
  $F_#text[net] = F_T$
])

Since the stopper is undergoing uniform circular motion, the net force must also be the centripetal force.

#align(center, [
  $F_#text[net] = F_c$
])

#numbered_eq($F_T = F_c$) <eq3>

Substituting @eq2 into @eq3:

#numbered_eq($F_c = F_(g 1)$) <eq4>

Therefore, the magnitude of the centripetal force is equal to the magnitude of the weight of the hanging mass.

== Part A (Period & Radius) <part1anal>
In all trials conducted in #link(<part1>)[Part A], the hanging mass was 130g. Thus, $F_c approx 1.28#text[N]$ for all trials#footnote[See #link(<work1>)[Appendix C.1.] for calculations.].

It is intuitive that when $f=0#text[Hz]$, $F_c=0N$ (no force at all). Thus, a graph can be plotted for all datapoints in @tab1, drawing a line from the origin, as illustrated in @plot1.

#figure(
  [#image("plot1.svg", width: 90%)],
  caption: [Centripetal Force vs. Frequency Squared at Various Radii]
) <plot1>

A vertical is then drawn at at 1.00hz#super([2]). By reading vertically across each line plotted, the centripetal force for a constant $f^2$ at each corresponding radius was determined:

#let table3 = table(
  columns: 5,
  stroke: frame(),
  table.header[\#][$m_#text[stopper]$ ($#text[kg]$)][$f^2$ ($#text[Hz]^2$)][$r$ ($#text[m]$)][$F_c$ ($#text[N]$)],

  [1], [$0.0329$], [$1.00$], [$0.410$], [$0.355$],
  [2], [$0.0329$], [$1.00$], [$0.520$], [$0.439$],
  [3], [$0.0329$], [$1.00$], [$0.600$], [$0.603$],
  [4], [$0.0329$], [$1.00$], [$0.710$], [$0.732$],
)

#figure(table3, caption: [Extrapolated Centripetal Forces at Various Radii]) <tab3>

Clearly, radius and centripetal force are linearly correlated with each other, as illustrated by plotting this data in @plot2. An $r$-value#footnote[Pearson's correlation coefficient. For the formula, please see #link(<formulae>)[Appendix B].] of $0.986$ indicates a very strong positive correlation.

#figure(
  [#image("plot2.svg", width: 90%)],
  caption: [Centripetal Force vs. Radius ($r approx 0.986$)]
) <plot2>

Using the equation for line of best fit from @plot2, the following experimental equation for centripetal force arises:

#numbered_eq([$F_c approx (1.31#text[N]/#text[m])r-0.201#text[N]$]) <eq5>

The theoretical formula for centripetal force based on the parameters in @tab3 is#footnote[See #link(<work2>)[Appendix C.2.] for calculations.]:

#numbered_eq($F_c approx (1.30#text[N]/#text[m]) r$) <eq6>

@eq5 has a offset where @eq6 has none. Although the exact error cannot be calculated, this is a significant amount of error, considering its magnitude. The error for the slope is very low, at around $0.825%$.#footnote[See #link(<work3>)[Appendix C.3.] for calculations.]

== Part B (Period & Centripetal Force) <part2anal>
Using the conclusion reached from @forces, the following table can be produced by calculating the centripetal force for each trial from @part2#footnote[See #link(<work4>)[Appendix C.4.] for calculations.]:

#let table4 = table(
  columns: 6,
  stroke: frame(),

  table.header[\#][$F_c$ ($#text[N]$)][$r$ ($#text[m]$)][$m_#text[stopper]$ ($#text[kg]$)][$T$ ($#text[s]$)][$f$ ($#text[Hz]$)],

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
  $log(F_c) &=&& -2log(T) + log(4 pi^2 m r)$
])

The theoretical slope of a plot between $log(F_c)$ and $log(T)$ should be $-2$ and the y-intercept should be $log(4 pi ^2 m r)$.

By simply taking the log of $F_c$ and $T$ from @tab4, the following table is obtained:

#let table5 = table(
  columns: 5,
  stroke: frame(),

  table.header[\#][$log(F_c)$][$r$ ($#text[m]$)][$m_#text[stopper]$ ($#text[kg]$)][$log(T)$],

  [5], [$0.106$], [$0.500$], [$0.0329$], [$-0.133$],
  [6], [$0.0331$], [$0.500$], [$0.0329$], [$-0.126$],
  [7], [$-0.0540$], [$0.500$], [$0.0329$], [$-0.108$],
  [8], [$-0.163$], [$0.500$], [$0.0329$], [$-0.0921$],
)

#figure(
  table5,
  caption: [Data Recorded in #link(<part1>)[Part B] (Centripetal Force and Period), Logarithms]
) <tab5>

#pagebreak()

The following scatter plot and line of best fit can be generated from the data in @tab5:

#figure(
  [#image("plot3.svg", width: 90%)],
  caption: [Logarithm of Centripetal Force vs. Logarithm of Period ($r=-0.995$)]
) <plot3>

Visually, the data displays a strong negative correlation. The $r$-value of $-0.995$ indicates an almost exact linear correlation.

However, the slope and y-intercept both show high levels of deviation from the theoretical values derived from @eq1, at $213%$ and $294%$, respectively#footnote[See #link(<work5>)[Appendix C.5.] and #link(<work6>)[Appendix C.6.] for calculations.].

=== Relationship Between Centripetal Force & Frequency <part2anal2>
Much of the techniques used in this section will be similar to the techniques used in @part2anal1.

Using similar algebraic techniques, the following linear relationship is obtained between $log(F_c)$ and $log(f)$:

#align(center, math.equation[
  $F_c &=&& 4 pi^2 m r f^2$ \
  $log(F_c) &=&& log((4 pi^2 m r) f^2)$ \
  $log(F_c) &=&& log(4 pi^2 m r ) + log(f^2)$ \
  $log(F_c) &=&& 2log(f) + log(4 pi^2 m r)$
])

Thus, the theoretical slope of a plot between $log(F_c)$ and $log(f)$ should be $2$ and the y-intercept should be $log(4 pi ^2 m r)$.

#pagebreak()

By taking the log of $F_c$ and $f$ from @tab4, the following table is obtained#footnote[The values for $log(f)$ are just the negatives of $log(T)$, since $f$ is just the reciprocal of $T$.]:

#let table6 = table(
  columns: 5,
  stroke: frame(),

  table.header[\#][$log(F_c)$][$r$ ($#text[m]$)][$m_#text[stopper]$ ($#text[kg]$)][$log(f)$],

  [5], [$0.106$], [$0.500$], [$0.0329$], [$0.133$],
  [6], [$0.0331$], [$0.500$], [$0.0329$], [$0.126$],
  [7], [$-0.0540$], [$0.500$], [$0.0329$], [$0.108$],
  [8], [$-0.163$], [$0.500$], [$0.0329$], [$0.0921$],
)

#figure(
  table6,
  caption: [Data Recorded in #link(<part1>)[Part B] (Centripetal Force and Frequency), Logarithms]
) <tab6>

Using the above data, the below scatter plot can be produced:

#figure(
  [#image("plot4.svg", width: 90%)],
  caption: [Logarithm of Centripetal Force vs. Logarithm of Frequency ($r=0.995$)]
) <plot4>

Undeniably, @plot4 shows a clear positive relationship between frequency and centripetal force. An $r$-value of $0.995$ indicates a very strong positive correlation between the logarithms of these values. 

Note that the values for slope ($~6.27$) and $r$ are both the negatives of the values found in @plot3. This is expected, given that frequency is the reciprocal of period, and taking the reciprocal is equivalent to raising a value to the -1#super[st] power.

The y-intercept is also identical, which is also expected based on the nature of log-linearization.

However, this also means that the errors for slope and y-intercept are equally as high as in @part2anal1, at $213%$ and $294%$, respectively.#footnote[See #link(<work7>)[Appendix C.7.] and #link(<work6>)[Appendix C.6], respectively, for calculations.]

= Evaluation <eval>
== Application to a Theoretical Situation
Using these results, it is possible to extrapolate the centripetal force required to rotate the rubber stopper where $r=1.5#text[m]$ and $f=8.0#text[Hz]$.

From @plot4, the following equation for centripetal force arises:

#numbered_eq($log(F_c) = 6.27log(f) - 0.738$) <eq7>

Comparing with the theoretical equation from @part2anal2:

#align(center, math.equation[
  $log(F_c) &=&& 2log(f) + log(4 pi^2 m r)$
]) 

Since the experimental equation shows some deviation as discussed in @part2anal2, we cannot directly substitute for the mass of the stopper. Instead, we will define a constant coefficient of the radius to interpolate the y-intercept from @eq7 into this situation.

Let $n=4pi^2m$. By inspection:

#align(center, math.equation[
  $-0.738 &=&& log(n r)$ \
  $-0.738 &=&& log(n (0.500#text[m]))$ \
  $0.5n &=&& 10^(-0.738)$ \
  $n &approx&& 0.366#footnote[Although $n$ has units (#text[kg]), the units are meaningless in this context as $n$ was a constant created to account for error and thus, the units have been omitted.]$
])

Finding the new y-intercept for $r=1.5#text[m]$:

#align(center, math.equation[
  $log(n r) &=&& log(0.36552423 times 1.5#text[m])$ \
  $&=&& log(0.548286345)$ \
  $&approx&& -0.261$ 
])

Substitute $log(n r) = -0.261$ and $f=8.0#text[Hz]$ into @eq7:

#align(center, math.equation[
  $log(F_c) &=&& 6.27log(f) - 0.26099257$ \
  $log(F_c) &=&& 6.27log(8.0#text[Hz]) - 0.26099257$ \
  $log(F_c) &=&& 5.65922972 - 0.26099257$ \
  $log(F_c) &=&& 5.39823715$ \
  $F_c &=&& 2.50 times 10^5#text[N]$
])

Clearly, this value is outlandishly high, likely due to the experimental exponent being $6.27$. As discussed, this is much higher than the theoretical exponent of $2$, meaning that the experimental results expect $F_c$ to grow at a much higher rate.

== Sources of Error
There are likely several factors which contributed to the high level of error seen in this report. This section will attempt to address the most exorbitant sources and suggest solutions to mitigate this error.

=== Issues with Assumptions
A number of assumptions were made in @assume to reduce the complexity of calculations. The two that most likely contributed most to the error observed were neglecting friction and neglecting the force of gravity on the stopper.

As noted in @qualia, it was observed that the paperclip would occasionally not respond to changes in speed. This is undoubtedly due to the friction experienced by the string on the tube. 

To mitigate this effect, it may be preferable to spin at slower speeds to minimize the centripetal force and thus the reaction force of the tube on the fishing line.

Furthermore, it may not be acceptable to consider the force of gravity on the stopper as negligable. Given a mass of $0.0329#text[kg]$, $F_(g#text[ stopper]) = (0.0329#text[kg])(9.81#text[m]/#text[s]^2) approx 0.323#text[N]$. 

This is in fact extremely significant, especially when compared to the assumed centrifugal forces calculated in @anal, being as much as $47.0%$ in the case of trial 8.#footnote[Calculations: $frac(0.322749#text[N], 0.6867#text[N]) times 100% = 0.47 times 100% = 47.0%$.]

When drawing the free body diagram for the stopper considering gravity, it becomes clear why this is significant:

#figure(
  [#image("fbd3.svg", width: 30%)],
  caption: [Free body diagram of the stopper, considering gravity]
)

Some tension (resulting from the weight of the hanging mass) must counteract the weight of the stopper in order to prevent it from falling down. This also matches observations in @qualia.

Thus, our previous analysis has likely vastly overestimated the centrifugal force acting on the stopper. To account for this inaccuracy, @eq3 and @eq4 should be re-evaluated to incorporate $theta$ and $F_(g #text[ stopper])$.

It may also be prudent to use a lighter stopper or a heavier hanging mass in order to make the weight of the stopper much more smaller relative to the weight of the hanging mass.

=== Timing
While timing, group members noticed the difficulty associated with accurately starting and stopping the timer during the proper intervals.

Especially given the small time scales on which this experiment depends, minute errors in timing can result in large discrepancies in the experimental results.

Instead of only timing ten revolutions as described in @trial, it may be better to time twenty or even larger numbers of revolutions and to have multiple timers to verify each other's times.

= Findings
Given the strong positive correlations ($r > 0.95$) seen in @plot2 and @plot4, in conjunction with the strong negative correlations ($r < -0.95$) seen in @plot3, the following proportionality statements can be reasonably made:

1. $F_c prop r$
2. $F_c prop 1/T^k$
3. $F_c prop f^k$

Where $k in ZZ_+$

These conclusions partially verify the hypotheses made in @hyp. 

However, more work needs to be done to verify the value of $k$, which should theoretically be $2$, and eliminate the y-intercept errors found.

Overall, some general conclusions about the relationship between variables in centripetal force can be made. However, given the high error values $>200%$ found in @part2anal, this report has unfortunately failed to fully verify the theoretical equations for centripetal force.
