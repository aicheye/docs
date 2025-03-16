#import "@preview/ilm:1.4.1": *

#set text(lang: "en")
#set math.equation(numbering: none)

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

#let definitions = {
  [
    = Definitions of Symbols <defs>
    $F_c$: centripetal force (newtons / $N$)

    $F_g$: weight (newtons / $N$)

    $F_T$: tension (newtons / $N$)
    
    $m$: mass (kilograms / $k g$)

    $r$: radius---specifically of the circular path created by an object undergoing uniform circular motion (meters / $m$)

    $v$: velocity---in this report, tangential velocity in particular (meters per second / $m/s$)

    $T$: period---the time it takes an object experiencing uniform circular motion to complete one revolution (seconds / $s$)

    $f$: frequency---the number of revolutions per second (hertz / $h z$ / $s^(-1)$)

    $pi$: the ratio of a circle's circumference to its diameter.
  ]
}

#show: ilm.with(
  title: [Uniform Circular Motion: Investigating Centripetal Force, Radius, Period, and Frequency],
  author: "Sean Yang",
  date: datetime(year: 2025, month: 03, day: 18),
  abstract: [
    Lab Partners: Eddie Qu, Wen Zheng Dong \
    Mr. Kanowitz, SPH4U1-23
  ],
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true),
  appendix: (
    enabled: true,
    body: definitions,
  ),
)

= Introduction
== Purpose
This report seeks to examine the effect of centripetal force on variables essential to uniform circular motion.

== Question
What is the relationship between centripetal force and:
+ Radius
+ Period
+ Frequency

== Hypothesis
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
  [#image("setup.png", width: 60%)], 
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

#figure(table1, caption: [Data recorded in #link(<part1>)[Part A]])
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


#figure(table2, caption: [Data recorded in #link(<part2>)[Part B]])
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

== Forces Involved
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

== Part A (Period & Radius)
In all trials conducted in #link(<part1>)[Part A], the hanging mass was 130g. 

Finding $F_c$ for all trials is trivial:

#align(center, math.equation($
  F_c &&=& F_(g_1) \
  F_c &&=& F_(g 1) = m g \
  F_c &&=& 0.130k g times 9.81m/s^2 \
  F_c &&approx& 1.28N
$, 
numbering: none,
))

= Evaluation <eval>
