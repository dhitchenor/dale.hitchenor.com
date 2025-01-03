#metadata((
  title: "Why Typst Deserves a Look, Especially If You Write for Academia",
  date: "2026-07-11",
  tags: ("typst", "markdown", "academia", "typesetting", "writing"),
  category: "Writing",
  slug: "typst-vs-markdown",
))

Markdown won because it got out of the way. Typst is starting to win for a
different reason: it gets out of the way *and* still lets you do the things
Markdown was never built for. This post is about why that distinction
matters, where Typst actually came from, and how far it has (and hasn't)
moved into academic publishing.

= A quick recap: where Markdown came from, and where it stops

Markdown was designed in 2004 by John Gruber, with help from Aaron Swartz,
for a very specific job: letting people write web copy in something that
still looked readable as plain text, then converting that to clean HTML
without touching a single angle bracket. It succeeded completely at that
job. Asterisks for emphasis, dashes for lists, a blank line for a new
paragraph. Nothing about it demanded you think like a programmer or a
typesetter.

That narrowness is also exactly its limit. Markdown has no native concept
of a footnote, a numbered figure, a cross-reference, or a real table with
merged cells. It has no math mode. The moment you need any of that, you're
either dropping into raw HTML (which defeats the entire point of writing
Markdown in the first place), or reaching for a flavor-specific extension
that half your renderers won't understand.. or giving up and opening Word.
For blog posts, READMEs, and changelogs, none of this matters. For a
thesis, a paper, or a report with real figures and citations, it matters a
lot.

= The gap Markdown left, and who filled it before Typst

The obvious answer to "I need real typesetting" has been LaTeX since the
early 1980s. LaTeX itself sits on top of Donald Knuth's TeX, a typesetting
engine Knuth released in 1978 after growing frustrated with the declining
print quality of his own books. Leslie Lamport built LaTeX as a set of
higher-level macros on top of TeX so authors didn't have to write raw TeX
commands for every document. It worked, and it's still the standard in
mathematics, physics, and computer science today, for good reason: the
output quality is genuinely excellent, and TeX's line-breaking algorithm
(the Knuth-Plass algorithm) produces better-justified paragraphs than
almost anything else in mainstream use.

But LaTeX's learning curve is real, and it hasn't become any more meaningfully
'gentle' in forty years; You're writing in a macro language bolted onto
another macro language. Error messages routinely point at the wrong line,
or at no line in particular. There are multiple engines (`pdflatex`,
`xelatex`, `lualatex`) with overlapping but not identical capabilities, and
picking the wrong one for a package you need is a rite of passage every
new user goes through at least once. Compilation is slow enough that
instant preview, the thing web developers take for granted, has never
really been possible.

So for two decades, the choice was blunt: Markdown if you wanted something
approachable, LaTeX if you needed real typesetting and were willing to pay
for it in time and frustration. Typst is an attempt to stop making people
choose.

= Where Typst actually came from

Typst began in 2019 in Berlin, started by Martin Haug and Laurenz Mädje.
Mädje was the primary language designer, and the project grew out of his
master's thesis #cite(<madje_L_09_2022>) at the Technical University of Berlin,
which explored what a modern markup language for typesetting could look
like if it were designed from scratch instead of accreting on top of
1978-era TeX. Haug, who came from a web development and design background,
took on the product and usability #cite(<haug_M_10_2022>); between the two of them the split was roughly "language and compiler" versus "editor and
experience," and that division still shows in how the project is built today.

The compiler #cite(<typst_nd_site>) is written in Rust, which is a big part of why compilation
feels closer to instant than to "go get a coffee." Typst went into public
beta and open-sourced its compiler under the Apache 2.0 license in March
2023, run since then by Typst GmbH, which also operates a paid
collaborative web editor (in the same spirit as Overleaf) alongside the
free, self-hostable compiler and CLI. So unlike a lot of "LaTeX killer"
attempts before it, Typst wasn't a hobby project that stalled after a
promising demo. It had a company, a funding model, and a compiler good
enough to use (in all honesty) more or less from day one of the public
release.

= Why Typst is a genuine step up from Markdown, not just a LaTeX clone

The easiest way to describe Typst is: it looks like Markdown until the
moment you need it not to.

Plain prose in Typst reads almost exactly like Markdown. Asterisks for
*bold*, underscores for _italics_, dashes for bullet lists, `=`, `==`,
`===` for heading levels instead of `#`, `##`, `###`. If that were the
whole story, Typst would just be "Markdown with different heading syntax,"
which wouldn't be worth writing about. What makes it different is what
sits directly underneath that familiar surface:

- *Real functions, not format-specific extensions.* Every piece of
  Typst's built-in formatting, from `#table(...)` to `#figure(...)` to
  `#align(center)[...]`, is an actual function call with real arguments.
  There's no separate "GFM tables" dialect you have to hope your renderer
  supports; a table is just `#table()`, full stop, everywhere.
- *A scripting language built in, not bolted on.* You can define a
  variable with `#let`, write a loop, or build a function, directly inside
  the same document, in the same syntax you're already writing prose in.
  Markdown has no equivalent at all; the closest thing is a preprocessor
  living entirely outside the format.
- *Math mode as a first-class citizen.* Dollar-sign math in Typst
  compiles to properly kerned, properly typeset equations using the same
  line-breaking heritage as TeX. Markdown's math support, where it exists
  at all, is a bolted-on extension that varies wildly by renderer.
- *Consistent styling through sets and shows, instead of scattered raw
  HTML.* Want every heading to use a different font? One `#set` rule at
  the top of the document, and it applies everywhere, consistently. The
  Markdown equivalent is usually copy-pasted inline HTML and inline
  `style=` attributes scattered through the document, which is exactly the
  kind of thing Markdown was invented to avoid in the first place.
- *One compiler, instant preview.* There's no `pdflatex` versus `xelatex`
  decision to make. Because compilation is fast, Typst's own editor (and
  several third-party ones) can show you the typeset result as you type,
  something LaTeX's compile times have never made practical.

I know this may sound like I'm not a big fan of Markdown, and this could not
be further from the truth; Markdown has its place, and I still use it to this
day; so don't get me wrong here; however the net effect is that Typst
doesn't ask you to become a different kind of writer to get a real document
(when it is needed) out of it. You write close to how you'd write Markdown,
and the ceiling for what that writing can become, tables, math,
cross-references, custom layouts, is just much higher than Markdown's ceiling.

= Typst's place in academia, honestly assessed

This is the part worth being level-headed about, because it's easy to
oversell.

Some academic and technical writers have adopted Typst quickly relative to
how recently it launched. There's now a real ecosystem of unofficial templates
for major venues, ML and engineering conferences among them, along with
templates approximating journal house styles from large publishers.
Individual authors and small groups have written templates that get
LaTeX-conference formatting requirements close enough to submit a Typst
paper as a PDF where the venue's process allows PDF-only submission.

But "you can produce a compliant PDF" is not the same as "the publishing
pipeline accepts Typst as an input format," and right now, it largely
doesn't. arXiv's ingestion pipeline is built entirely around known LaTeX
distributions; it doesn't understand `.typ` source at all yet, though
authors can still submit the compiled PDF as a workaround where that's
permitted. Most major publishers, journals, and conference management
systems have the same gap: they know how to run LaTeX, and they don't yet
know how to run Typst. Larger publishers who already have costly manual
formatting pipelines can absorb a PDF-only submission; smaller and diamond
open-access journals, several of which run on genuinely tight budgets,
often can't afford that flexibility, which is precisely where you'd expect
Typst's speed and lower barrier to entry to help most, and precisely where
institutional inertia is slowest to move.

The people actually working on this seem to agree the real turning point
is Typst reaching a stable 1.0 release with a frozen-enough API that
publishers can commit engineering time to supporting it without the
ground shifting under them. Academic infrastructure moves slowly by
design, for good reasons around long-term archival stability, so this is
better read as "in progress and genuinely promising" rather than "already
arrived." If you're writing a thesis, a preprint you'll self-host or post
as a PDF, or an internal technical report, Typst is very usable today. If
you need your source format itself accepted by a specific journal's
submission system, it's worth checking that journal directly before you
commit to it.

= Where that leaves things

None of this makes Markdown worse at the job it was built for. It's still
the right tool for a blog post, a README, a changelog. But "the right tool
for a blog post" was never a fair standard to hold serious technical
writing to, and for a long time, LaTeX was the only real alternative,
with all the friction that came with it. Typst is the first tool in a long
while that closes that gap without asking you to give up the parts of
Markdown that made it good in the first place. That's the actual pitch,
and it's a big part of why this site's own Typst plugin exists: keeping
posts that need real layout control in a format that reads like text I'd
actually want to write, rather than markup I have to fight.

#v(1em)
#line(length: 100%, stroke: 0.5pt + gray)
#v(0.5em)
#text(size: 9pt, fill: gray)[
  Tags: typst, markdown, academia, typesetting, writing
]

#bibliography((
  madje_L_09_2022: "Mädje, L. (2022). A Programmable Markup Language
  for Typesetting.",
  haug_M_10_2022: "Haug, M. (2022). Fast Typesetting with Incremental Compilation.",
  typst_nd_site: "Typst.app. (n.d.). Open Source at Typst. _Install the compiler._ Retrieved from https://typst.app/open-source/#download",
))
