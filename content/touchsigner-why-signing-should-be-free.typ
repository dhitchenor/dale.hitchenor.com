#metadata((
  title: "Why Signing Your Name Shouldn't Need a Subscription",
  date: "2026-10-30",
  tags: ("touchsigner", "digital-signatures", "open-source", "digital-divide", "opinion", ),
  category: "Opinion",
  slug: "touchsigner-why-signing-should-be-free",
  summary: "A breakfast, a laptop, no printer, no scanner, and a document that needed signing right now. On TouchSigner, and why being able to sign your own name in the information age should be a right rather than a paid service.",
))

It was a perfectly ordinary morning. Coffee, eggs, tomato, and my laptop
open on the kitchen table, picking away at some work before the day
properly started. Then an email came in: a document that needed my
signature, and needed it back _today_. Not next week, not after I'd
found time to get to a library or a print shop. Today.

So I did the mental checklist that I suspect a lot of people do in that
moment. Printer? Don't own one. Scanner? Don't own one of those either,
and honestly, who does anymore? The "proper" route (print it, sign it,
scan it, send it back) was dead on arrival. The other route was the one
the internet keeps nudging you towards: upload your document to some
e-signature service, create an account, hand over your email address,
and either squeeze inside a free tier that's been deliberately cut down
until it's barely usable, or pull out a credit card.

To sign my own name. On a document I'd been sent. Over breakfast.

That's the moment this post started, because it struck me that something
about this is genuinely broken, and not in a small, "minor UX annoyance"
kind of way. And the thing that got me through that morning was a tiny,
slightly scrappy Python script called TouchSigner.

= What TouchSigner actually is

#link("https://github.com/dhitchenor/touchsigner")[TouchSigner] does one
thing: it lets you draw your signature with your finger on your laptop's
touchpad, and saves it as an image. That's it. It was originally written
by #link("https://github.com/souramoo/TouchSigner")[souramoo] back in 2015,
with a comment at the top of the source that sums up the whole project
better than I could: it was written because the author didn't have a
scanner. The fork I'm writing about brings it up to date for Python 3 and
adds SVG output alongside the original PNG.

Using it is about as simple as software gets:

- *Run it.* `./signer.py` opens a window and grabs the pointer, so your
  touchpad becomes a drawing surface rather than a mouse.
- *Draw.* Put your finger on the touchpad and sign, the same way you'd
  sign with a pen, without lifting your finger.
- *Save, reset or quit.* `Enter` saves the signature as both an SVG and a
  transparent PNG, `Escape` clears it so you can have another go, and `q`
  quits without saving.

The output drops straight into a PDF editor, a word processor, or
anything else that accepts an image. There's no account, no upload, no
server, no tracking, and no monthly envelope allowance. Your signature
never leaves your machine. It's GPL-2.0, it depends on nothing more
exotic than `pygame` and `tkinter`, and the whole thing is about 160 lines
of Python.

It is also, and I want to be completely upfront about this, _not_ a
cryptographic signature. It doesn't lock the document, it doesn't prove
who you are, and it doesn't stop anyone from editing the document after
you've signed it. It's a picture of your signature. That limitation is
actually the most interesting thing about it, and I'll come back to it,
because it points straight at the bigger problem.

= We moved our agreements onto documents, and someone built a toll booth

For most of history, an agreement between two parties was sealed with a
handshake, a witness, a wax seal, or ink on paper. Over the last few
decades the document, and specifically the digital document, has become
the way almost everything gets agreed: leases, employment contracts,
medical consent forms, school permission slips, tax declarations, bank
forms, insurance claims. Governments made this official. The United
States passed the ESIGN Act in 2000, giving electronic signatures legal
standing in commerce #cite(<esign2000>), and the European Union's eIDAS
regulation did the same across the EU in 2014 #cite(<eidas2014>).

That's genuinely good. What's not good is what happened next. Once
signing a digital document became _the_ way to participate in
contracts, housing, employment and public services, a market grew up
around charging people for the act itself. The best-known services in
the space charge somewhere in the region of USD 10 to 45 per user, per
month, depending on the tier, and the entry-level personal plans cap you
at a handful of documents a month #cite(<docusignpricing>). There are free
tiers, but they exist mainly to funnel people towards the paid ones.

I'll say it plainly: once documents became the modus operandi for
sealing agreements, charging people to sign them started to look a lot
like war profiteering. Not in the literal sense of tanks and arms
contracts, but in the sense that actually matters here: making money
from a situation that people are forced into and can't opt out of. You
don't _choose_ to need a signed rental agreement. You don't _choose_ to
need your employment contract signed by Friday. The need is imposed on
you, and the toll sits right in the middle of the only road through.

Signing something in the digital age needs to be available to everyone
who has to sign something, and it needs to be easy. Those are not two
separate requirements; an option that's technically free but requires a
smart card reader, a command line, and a working knowledge of public key
infrastructure is free in the same way a locked library is free.

= A signature on a screen is not a signature on paper

Here's where it gets more subtle, and where TouchSigner's limitation
becomes useful rather than embarrassing.

Signing a piece of paper and "signing" a digital document are
inherently different acts, and the difference isn't only technical. It's
psychological. Eileen Chou at the University of Virginia ran seven
studies comparing handwritten signatures with common e-signatures
(checkboxes, typed names, PINs) and found that people who signed
electronically were consistently more likely to cheat on the tasks that
followed #cite(<chou2015>). Her explanation is that a handwritten
signature is a symbolic extension of the self, whereas the bond people
feel with a typed name or a ticked box is transient and weak, so it
produces less "self-presence" at the moment of commitment. Crucially, she
found the problem lies in _how_ people sign, not in how the signature is
transmitted afterwards.

That lines up with earlier work by Kettle and Häubl, who found that the
simple act of writing your own signature primes your sense of identity
strongly enough to change your behaviour afterwards #cite(<kettle2011>).
A signature isn't just a mark that a court can look at later. It's a
small ritual that tells _you_ that you meant it.

Which means TouchSigner, scrappy as it is, gets something right that a
lot of polished commercial tools get wrong: it keeps your hand in the
act. You're drawing your actual signature, with your actual finger, in
your actual scrawl. Not ticking a box. Not typing your name into a field
and watching a cursive font pretend to be you.

But paper has another property that TouchSigner doesn't replicate: it's
hard to tamper with invisibly. Ink soaks into fibres. Crossed-out words
look crossed out. A forged signature on paper has to be physically
forged. A PNG of your signature, on the other hand, can be copied onto
any document, by anyone who has it, forever.

The technology to fix _that_ has existed for half a century. Diffie and
Hellman described the idea of a digital signature in 1976, a way for
anyone to verify that a message came from a particular person and hasn't
been altered since #cite(<diffie1976>). In principle, tamper-evident
signing is a solved problem. In practice, two things keep getting in the
way.

- *It's hard to use.* Whitten and Tygar's classic usability study of
  PGP found that most participants, given ninety minutes, couldn't
  successfully sign and encrypt a message, and several accidentally
  exposed the very secret they were meant to protect
  #cite(<whitten1999>). The cryptography was sound; the humans were
  simply never designed for.
- *Even the commercial implementations aren't as solid as they claim.*
  In 2019, researchers at Ruhr University Bochum tested 22 PDF viewers
  and found that 21 of them could be fooled into showing altered content
  as validly signed, along with most of the online validation services
  they tried #cite(<mladenov2019>). They demonstrated it by turning a
  signed invoice into a one-trillion-dollar refund without breaking the
  signature.

So the paid services aren't selling you a solved problem. They're
selling you a convenience layer on top of a half-solved one, and charging
rent for it.

= Tamper-proofing should be a right, not a subscription

The ability to sign a document, in a way that means nobody can quietly
edit it or forge your signature onto something else, should be treated
the way we treat a passport or a birth certificate: as part of the basic
infrastructure of being a person in a society, not as a premium feature.

This isn't a utopian position. It's one that some governments have
already reached. Estonia gave cryptographic signatures the same legal
weight as handwritten ones in 2000 #cite(<estonia2000>), and since 2002
every ID card holder has been able to sign legally binding documents
using free state-provided software #cite(<skid2002>). More recently, the
EU's eIDAS 2 regulation goes further: the European Digital Identity
Wallet it mandates must let every person create qualified electronic
signatures, the kind legally equivalent to a handwritten one, free of
charge for non-professional purposes #cite(<eidas2024>). The wallets are
due to start reaching people right around now.

In other words, at least one major legislative body has looked at this
problem and concluded the same thing: signing your own name is a civic
function, and charging people for it is wrong. The rest of the world,
including most of the English-speaking world, hasn't caught up. If you
live outside those systems, your options are still: pay a company, wrestle
with tooling built for cryptographers, or draw your signature with your
finger and hope nobody misuses the image.

= The divide is the problem

This is the part I keep coming back to, and the part TouchSigner exposes
without meaning to.

When something as basic as "sign your name" works one way offline and an
entirely different (more expensive, more confusing, less trustworthy)
way online, the gap between digital life and normal life gets wider. And
that gap isn't neutral. It costs people.

Research on the digital divide has moved well beyond "who has internet
access." Van Deursen and van Dijk showed that the divide now shows up in
_how_ people use the internet, with less advantaged groups getting less
out of the same access #cite(<vandeursen2014>), and Helsper's work makes
the case that digital exclusion tends to mirror and reinforce existing
social exclusion rather than sitting alongside it #cite(<helsper2012>).
Every small toll and every confusing hurdle widens that gap a little
more. And those hurdles cost more than money. Mani and colleagues found
that financial worry measurably reduces cognitive performance, roughly
the equivalent of losing a night's sleep #cite(<mani2013>). Asking
someone who's already stretched to navigate a paywalled signing service,
on deadline, for a document they can't afford to get wrong, is asking
them to pay twice.

There's also a less obvious cost. When the digital world runs on different
rules from the physical one, people start to treat it as a different
place, a place where the normal rules don't quite apply. Suler's
well-known paper on the online disinhibition effect describes exactly
this: part of why people behave worse online is that they experience it
as a separate space, disconnected from their "real" identity and the
consequences that come with it #cite(<suler2004>). Lapidot-Lefler and
Barak later found that it's the lack of eye contact, the missing
physical cues of ordinary life, that does much of the damage, more than
anonymity alone #cite(<lapidot2012>).

Put that next to Chou's finding about e-signatures and a pattern
emerges. When digital acts lose the weight and presence of their
physical equivalents, people feel less bound by them. A typed name
doesn't feel like _you_. A comment fired off into a void doesn't feel
like something you said to another person's face. That disconnect, that
_leap_ from normal life into digital life, is a big part of what makes
digital life more toxic than it needs to be. Digital tools should
supplement and improve ordinary life, not replace it with a cheaper,
colder, paywalled imitation.

= What TouchSigner doesn't fix, and what it does

To be fair to the project, and to anyone deciding whether to use it:

- *It doesn't make documents tamper-proof.* The output is an image. If
  integrity matters, you still need a cryptographic signature on top.
- *It doesn't prove identity.* Anyone with your PNG can paste it
  anywhere. Treat the saved files with the same care you'd treat a
  photo of your signed cheque.
- *It doesn't produce a legally "qualified" signature.* For most
  everyday documents a drawn signature is perfectly acceptable, but some
  contexts require more.

And what it does do:

- *It's free, local and private.* No account, no upload, no envelope
  limits, no data leaving your machine.
- *It keeps the human act intact.* You draw your own signature with your
  own hand, which, if Chou is right, is the part that actually carries
  psychological weight.
- *It solves the breakfast problem.* No printer, no scanner, no
  subscription, and a signed document back in someone's inbox before the
  coffee goes cold.

TouchSigner doesn't solve the bigger issue, and it was never meant to. But
it's a useful mirror. The fact that a 160-line script written because
someone didn't own a scanner is, for a lot of people, the most practical
free way to put their own signature on a document in 2026 says less about
the script than it does about us. Signing your name is one of the oldest
ways a person says "I mean this." In the information age, it should be
free, easy, and safe for everyone who has to do it, and until it is, we
should keep asking why it isn't.

#bibliography((
  esign2000: "United States Congress (2000). Electronic Signatures in Global and National Commerce Act (ESIGN), Public Law 106-229.",
  eidas2014: "European Parliament and Council (2014). Regulation (EU) No 910/2014 on electronic identification and trust services for electronic transactions in the internal market (eIDAS). Official Journal of the European Union, L 257.",
  docusignpricing: "Meetergo (2026). DocuSign pricing: plans, envelope allowances and hidden costs. Pricing checked August 2026. https://meetergo.com/en/magazine/docusign-pricing",
  chou2015: "Chou, E. Y. (2015). What's in a name? The toll e-signatures take on individual honesty. Journal of Experimental Social Psychology, 61, 84-95. doi:10.1016/j.jesp.2015.07.010",
  kettle2011: "Kettle, K. L., and Häubl, G. (2011). The signature effect: Signing influences consumption-related behavior by priming self-identity. Journal of Consumer Research, 38(3), 474-489.",
  diffie1976: "Diffie, W., and Hellman, M. E. (1976). New directions in cryptography. IEEE Transactions on Information Theory, 22(6), 644-654.",
  whitten1999: "Whitten, A., and Tygar, J. D. (1999). Why Johnny can't encrypt: A usability evaluation of PGP 5.0. Proceedings of the 8th USENIX Security Symposium.",
  mladenov2019: "Mladenov, V., Mainka, C., Meyer zu Selhausen, K., Grothe, M., and Schwenk, J. (2019). 1 Trillion Dollar Refund: How to spoof PDF signatures. Proceedings of the 2019 ACM SIGSAC Conference on Computer and Communications Security (CCS '19). doi:10.1145/3319535.3339812",
  estonia2000: "Riigikogu (2000). Digital Signatures Act (Estonia). Passed 8 March 2000, in force 15 December 2000.",
  skid2002: "SK ID Solutions (2002). Year 2002 at SK ID Solutions: free DigiDoc client software for all ID card holders. https://www.skidsolutions.eu/news/year-2002-at-sk-id-solutions/",
  eidas2024: "European Parliament and Council (2024). Regulation (EU) 2024/1183 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework (eIDAS 2), Article 5a.",
  vandeursen2014: "van Deursen, A. J. A. M., and van Dijk, J. A. G. M. (2014). The digital divide shifts to differences in usage. New Media and Society, 16(3), 507-526.",
  helsper2012: "Helsper, E. J. (2012). A corresponding fields model for the links between social and digital exclusion. Communication Theory, 22(4), 403-426.",
  mani2013: "Mani, A., Mullainathan, S., Shafir, E., and Zhao, J. (2013). Poverty impedes cognitive function. Science, 341(6149), 976-980.",
  suler2004: "Suler, J. (2004). The online disinhibition effect. CyberPsychology and Behavior, 7(3), 321-326.",
  lapidot2012: "Lapidot-Lefler, N., and Barak, A. (2012). Effects of anonymity, invisibility, and lack of eye-contact on toxic online disinhibition. Computers in Human Behavior, 28(2), 434-443.",
))
