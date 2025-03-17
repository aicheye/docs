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
+ Radius
+ Period
+ Frequency

== Hypothesis <hyp>
Based on the following accepted formulae#footnote[For definitions of symbols, please refer to #link(<defs>)[Appendix A]]:

#align(center, [
  $F_c = frac(m v^2, r)$

  $v = frac(2 pi r, T)=2 pi r f$
])

It is derived that:

#align(center, [
  $F_c = frac(4 pi^2 m r, T^2)= 4 pi^2 m r f^2$
])

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
- Mass of the object experiencing uniform circular motion ($m$)

== Part B (Period & Centripetal Force)
Manipulated variable: 
- Centripetal force ($F_c$)

Responding variable: 
- Period ($T$)

Control variables:
- Radius of the path of circular motion ($r$)
- Mass of the object experiencing uniform circular motion ($m$)

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

== Trial
+ For each trial, steps 5--7 in @prep were repeated.
+ The hollow tube was held in one hand and the hanging mass in the other. The apparatus was then slowly lifted.
+ Begin twirling the rubber stopper horizontally. Keep the hanging mass stationary.
+ Slowly release the hanging mass, maintaining a constant speed.
+ If the paperclip is too low, rotate faster.
+ If the paperclip is touching the tube, rotate slower.
+ Once the paperclip is just below the hollow tube, maintain a constant speed.
+ Time and record how long it takes to complete 10 revolutions.

= Observations
== Qualitative Observations
It was difficult to maintain the paperclip at a consistent level. Often, the paperclip would become stuck and not respond as expected to changes in speed. 

It was also noted that it was difficult to maintain the rotation on a flat horizontal plane. The stopper's axis of rotation often tilted, and the stopper's plane of rotation tended to be below the top of the tube.

== Quantitative Observations
For all eight trials in #link(<part1>)[Part A] and #link(<part2>)[Part B], an identical stopper was used, with a mass of 32.9g.

=== Part A (Period & Radius) <part1>
Four trials were conducted, starting with the radius at 40cm and increasing by approximately 10cm each trial. For all trials, the hanging mass was 130g.

#let table1 = table(
  columns: 7,
  stroke: frame(),

  table.header[\#][$r$ ($m$)][$m_#text[stopper]$ ($k g$)][$m_#text([hanging])$ ($k g$)][$T#footnote[Calculated by dividing the time recorded on the timer by 10]$ ($s$)][$f#footnote[Reciprocal of $T$]$ ($h z$)][$f^2$ ($h z^2$)],

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

  table.header[\#][$r$ ($m$)][$m_#text[stopper]$ ($k g$)][$m_#text([hanging])$ ($k g$)][$T$#super([#sym.dagger]) ($s$)][$f$#super([#sym.dagger#sym.dagger]) ($h z$)][$f^2$ ($h z^2$)],

  [5], [$0.500$], [$0.0329$], [$0.130$], [$0.736$], [$1.36$], [$1.85$],
  [6], [$0.500$], [$0.0329$], [$0.110$], [$0.749$], [$1.34$], [$1.78$],
  [7], [$0.500$], [$0.0329$], [$0.090$], [$0.780$], [$1.28$], [$1.64$],
  [8], [$0.500$], [$0.0329$], [$0.070$], [$0.809$], [$1.24$], [$1.53$]
)


#figure(table2, caption: [Data Recorded in #link(<part2>)[Part B]])
<tab2>

= Analysis
== Initial Assumptions <assume>
For the purpose of simplicity for later calculations, it is assumed that:
- Friction is negligible
- Air resistance is negligible
- The string is massless, inelastic, and flexible (tension at every point is constant)
- The force of gravity acting on the stopper is negligible in comparison to the tension of the string

The validity of these assumptions will be discussed in @eval.

For all equations, assume that:
- $#text([up]) = plus.circle$, $#text([down]) = dash.circle$
- $#text([centripetal]) = plus.circle$, $#text([centrifugal]) = dash.circle$

== Forces Involved <forces>
As illustrated in @fig2, the only forces acting on the hanging mass are the force of tension on the string and the force of gravity, and these forces oppose each other.

#figure(
  [#image("fbd1.svg", height: 20%)],
  caption: [Free body diagram of the hanging mass]
) <fig2>

#align(center, [
  $F_#text([net]) = F_T - F_(g 1)$
])

Since the paperclip was kept at a constant level, it is therefore necessary that:

#align(center, [$F_#text([net]) = 0N$])

Thus,

#align(center, [
  $0 = F_T - F_(g 1)$
])

#numbered_eq($F_T = F_(g 1)$) <eq1>

#pagebreak()

As illustrated in @fig3, the only force acting on the stopper is the force of tension (recall that it was assumed that the force of gravity is negligible in @assume). Thus, this is also the net force.

#figure(
  [#image("fbd2.svg", width: 20%)],
  caption: [Free body diagram of the rotating stopper]
) <fig3>

#align(center, [
  $F_#text([net]) = F_T$
])

Since the stopper is undergoing uniform circular motion, the net force must also be the centripetal force.

#align(center, [
  $F_#text([net]) = F_c$
])

#numbered_eq($F_T = F_c$) <eq2>

Substituting @eq1 into @eq2:

#numbered_eq($F_c = F_(g 1)$) <eq3>

Therefore, the magnitude of the centripetal force is equal to the magnitude of the weight of the hanging mass.

== Part A (Period & Radius) <part1anal>
In all trials conducted in #link(<part1>)[Part A], the hanging mass was 130g. Thus, $F_c approx 1.28N$ for all trials#footnote[See @work1 for calculations.].

It is intuitive that when $f=0h z$, $F_c=0N$ (no force at all). Thus, a graph can be plotted for all datapoints in @tab1, drawing a line from the origin, as illustrated in @plot1.

#figure(
  [#image("plot1.svg", width: 90%)],
  caption: [Centripetal Force vs. Frequency Squared at Various Radii]
) <plot1>

A vertical is then drawn at at 1.00hz#super([2]). By reading vertically across each line plotted, the centripetal force for a constant $f^2$ at each corresponding radius was determined:

#let table3 = table(
  columns: 5,
  stroke: frame(),
  table.header[\#][$m_#text[stopper]$ ($k g$)][$f^2$ ($h z^2$)][$r$ ($m$)][$F_c$ $(N)$],

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

#numbered_eq([$F_c approx (1.31N/m)r-0.201N$]) <eq4>

The theoretical formula for centripetal force based on the parameters in @tab3 is#footnote[See @work2 for calculations.]:

#numbered_eq($F_c approx (1.30N/m) r$) <eq5>

@eq4 has a offset where @eq5 has none. Although the exact error cannot be calculated, this is a significant amount of error, considering its magnitude. The error for the slope is very low, at around $0.825%$.#footnote[See @work3 for calculations.]

== Part B (Period & Centripetal Force) <part2anal>
Using the conclusion reached from @forces, it is trivial to calculate the centripetal force for each trial from @part2#footnote[See @work4 for calculations.]:

#let table4 = table(
  columns: 6,
  stroke: frame(),

  table.header[\#][$F_c$ $(N)$][$r$ ($m$)][$m_#text[stopper]$ ($k g$)][$T$ ($s$)][$f$ ($h z$)],

  [5], [$1.28$], [$0.500$], [$0.0329$], [$0.736$], [$1.36$],
  [6], [$1.08$], [$0.500$], [$0.0329$], [$0.749$], [$1.34$],
  [7], [$0.883$], [$0.500$], [$0.0329$], [$0.780$], [$1.28$],
  [8], [$0.687$], [$0.500$], [$0.0329$], [$0.809$], [$1.24$],
)

#figure(
  table4,
  caption: [Data Recorded in #link(<part1>)[Part B] (Centripetal Force)]
) <tab4>

=== Relationship Between Centripetal Force and Period
Using data in @tab4, a scatter plot can be generated to compare centripetal force and period:

=== Relationship Between Centripetal Force and Period
Using the data from @tab4, a scatter plot can be created to compare centripetal force to frequency:


= Evaluation and Conclusion <eval>
