#import "@preview/ilm:1.4.1": *

#set text(lang: "en")

#let frame() = (x, y) => (
  top: if y <= 1 { 1pt } else { 0pt },
  bottom: 1pt,
)

#let mfc = counter("mfc")

#set footnote(numbering: n => context { n - mfc.get().at(0) })

#show math.equation: it => {
  set footnote(numbering: n => context { str(sym.dagger) * (mfc.get().at(0) + 1) })
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

$F_c = frac(m v^2, r)$

$v = frac(2 pi r, T)=2 pi r f$

It is derived that:

$F_c = frac(4 pi^2 m r, T)= 4 pi^2 m r f$

Therefore, it is implicated that:
+ Centripetal force and radius are directly proportional ($F_c prop r$)
+ Centripetal force and period are inversely proportional ($F_c prop 1/T$)
+ Centripetal force and frequency are directly proportional ($F_c prop f$)

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

= Apparatus
== Equipment and Materials
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
  [#image("image.png", width: 60%)], 
  caption: [Experimental Setup]
)
<fig1>

= Procedure
== Preparation
+ The rubber stopper was weighed on the balance and the mass was recorded.
+ Approximately 1 meter of string was measured and cut.
+ A rubber stopper was tied to one end of the string.
+ The other end of the string was threaded through the hollow tube.
+ The desired radius was measured as shown in @fig1. The tube was fixed in place to mark this length.
+ A paperclip was taped securely to the string at the other end of the tube.
+ The desired hanging mass was tied to the loose end of the string.

== Trial
+ The hollow tube was held in one hand and the hanging mass in the other. The apparatus was then slowly lifted.
+ Begin twirling the rubber stopper horizontally. Keep the hanging mass stationary.
+ Slowly release the hanging mass, maintaining a constant speed.
+ If the paperclip is too low, rotate faster.
+ If the paperclip is touching the tube, rotate slower.
+ Once the paperclip is just below the hollow tube, maintain a constant speed.
+ Time and record how long it takes to complete 10 revolutions.

= Observations
== Qualitative Observations
It was difficult to maintain the paperclip at a consistent level. Often, the paperclip would become stuck and not respond as expected to changes in speed. It was also difficult to maintain the rotation on a flat horizontal plane. The paperclip tended to tilt and fall below the top of the tube.

== Quantitative Observations
For all eight trials in #link(<part1>)[Part A] and #link(<part2>)[Part B], the mass of the stopper was 32.9g.

=== Part A (Period & Radius) <part1>
Four trials were conducted, starting with the radius at 40cm and increasing by approximately 10cm each trial. For all trials, the weight of the hanging mass was 130g.

#align(center, 
  table(
    columns: 7,
    stroke: frame(),

    table.header[\#][$r$ ($m$)][$m_#text[stopper]$ ($k g$)][$m_#text([hanging])$ ($k g$)][$T#footnote[Calculated by dividing the time recorded on the timer by 10]$ ($s$)][$f#footnote[Reciprocal of $T$]$ ($h z$)][$f^2$ ($h z^2$)],

    [1], [$0.410$], [$0.0329$], [$0.130$], [$0.528$], [$1.89$], [$3.59$],
    [2], [$0.520$], [$0.0329$], [$0.130$], [$0.587$], [$1.70$], [$2.91$],
    [3], [$0.600$], [$0.0329$], [$0.130$], [$0.688$], [$1.45$], [$2.11$],
    [4], [$0.710$], [$0.0329$], [$0.130$], [$0.758$], [$1.32$], [$1.74$]
  )
)

=== Part B (Period & Centripetal Force) <part2>
Four trials were conducted, with the hanging mass at 130g and decreasing by 20g each trial. For all trials, the radius was 50cm.

#mfc.update(0)

#align(center, 
  table(
    columns: 7,
    stroke: frame(),

    table.header[\#][$r$ ($m$)][$m_#text[stopper]$ ($k g$)][$m_#text([hanging])$ ($k g$)][$T$#super([#sym.dagger]) ($s$)][$f$#super([#sym.dagger#sym.dagger]) ($h z$)][$f^2$ ($h z^2$)],

    [5], [$0.500$], [$0.0329$], [$0.130$], [$0.736$], [$1.36$], [$1.85$],
    [6], [$0.500$], [$0.0329$], [$0.110$], [$0.749$], [$1.34$], [$1.78$],
    [7], [$0.500$], [$0.0329$], [$0.090$], [$0.780$], [$1.28$], [$1.64$],
    [8], [$0.500$], [$0.0329$], [$0.070$], [$0.809$], [$1.24$], [$1.53$]
  )
)
