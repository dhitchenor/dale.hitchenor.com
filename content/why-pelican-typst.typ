#metadata((
  title: "Why Typst for Pelican?",
  date: "2026-07-05",
  tags: ("typst", "pelican", "plugin"),
  category: "Programming",
  slug: "why-pelican-typst",
))

= The itch that started it all

Pelican is a static site generator written in Python. It turns plain-text
content (Markdown or reStructuredText by default) into a fully rendered
blog, and it does this without a database, without a runtime server process,
and without much fuss. That simplicity is the whole appeal: write a post,
run `pelican content`, push the output somewhere static, done.

But "simple" and "flexible" aren't always the same thing. Markdown is great
for prose. It falls apart the moment you need a real table, a footnote with
actual formatting, or anything resembling a diagram. reStructuredText is
more capable, but the syntax fights back at every turn; directives,
indentation rules, and a general sense that you're negotiating with the
parser rather than writing.

= Enter Typst

Typst is a newer markup-based typesetting system, positioned somewhere
between LaTeX and Markdown. It has real functions, real variables, and a
layout engine that doesn't require a PhD to reason about. Tables are a
function call. Math is inline and readable. Custom layouts are just code.

The idea for *pelican-typst* was simple: what if Pelican could treat
`.typ` files as first-class content, the same way it treats `.md` files?
Write posts in Typst, get Pelican's templating, theming, and site
generation for free.

= The learning curve, honestly

Here's the part worth being upfront about: Pelican's own learning curve is
real, even before adding a new content format into the mix.

- The plugin system changed significantly between older and newer Pelican
  versions, so a lot of tutorials and Stack Overflow answers describe
  approaches that no longer apply.
- Understanding *where* a reader (the thing that turns a file into HTML)
  hooks into the generation pipeline takes some digging through source,
  since the documentation covers the common cases well but thins out fast
  for anything custom.
- Getting metadata (title, date, tags) parsed consistently between Typst's
  own comment syntax and Pelican's expected front-matter format required a
  few false starts before settling on a clean convention.

None of this is a criticism of Pelican, however once the mental model clicks, it's
a genuinely pleasant tool to extend. But the first few hours were mostly
spent reading generator and reader base classes to figure out the contract
a plugin actually needs to fulfill.

= Building the module

The rough process looked like this:

+ *Prototype the conversion step first, outside Pelican entirely.* Get a
  `.typ` file turning into clean HTML using Typst's own compiler, before
  worrying about integration at all.
+ *Write a minimal Pelican reader.* Subclass the base reader, register the
  `.typ` extension, and get a single hard-coded file rendering inside an
  existing theme.
+ *Solve metadata parsing.* Typst comments (`// key: value`) became the
  front-matter convention, parsed before handing the rest of the file to
  the Typst compiler.
+ *Handle assets.* Images and includes referenced from `.typ` files needed
  paths resolved relative to the content directory, not the output
  directory; a detail that caused more than one broken build.
+ *Test against real content.* Long posts, posts with tables, posts with
  math; each surfaced a small edge case in how Typst's output HTML mapped
  onto Pelican's template expectations.

= Where it stands

The result is a small reader plugin: drop `.typ` files into a Pelican
content directory, and they get picked up, converted, and themed like any
other post. It's not trying to replace Markdown support, instead it's an option
for the posts where Typst's layout control is worth the extra setup.

#v(1em)
#line(length: 100%, stroke: 0.5pt + gray)
#v(0.5em)
#text(size: 9pt, fill: gray)[
  Tags: pelican, typst, plugin
]
