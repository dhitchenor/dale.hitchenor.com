---
layout: post
title: Why jekyll?
date: 2025-01-06 13:25:00 +1000
---

### Why Jekyll? (and why dark-poole theme?)

This journey all started when I was toying with an old PC, discarded by a company that previously used the aforementioned PC as a POS (point of sale) system; it was only the **tower** as we used to call it, back in the day.. except Mum.. she called it the 'hard drive', but that's another story.

As they were going to be thrown out anyway, I was able to procure two of these lovely pieces of equipment with the permission of the company, and bring it home to put to good use. Even to this day, one of these systems hasn't even been touched since it crossed the threshold of the house, instead it waits patiently for a stroke of inspiration that compels me to dig it out, and tear at it maniacally with various tools, keyboards and USB sticks each occupied with a sole undisclosed linux distribution.. not that it's a secret, but there's so many, and I don't discriminate here.. any flavour of the day, really.

Alas, I _digress_.. **Moving on.**

The second machine, the same one, still in use, til this very day! has various open source server-based applications that provide the 'other' part to the various clients that I have installed on my second brain (just to make this fast paced life, a bit easier; naturally, I wanted to self host a website/portfolio as I had just started some further study into another of my various vices, pursuing my lifelong quest to understand everything around me. During these studies, it became apparent that I would need a way to document what I learn, in such a way that the world could see what the positively charged lump bouncing around inside my cranium was creating, and trying to manifest physically through 10 of my most precious tools; that was obvious to me, the big question, however, was: _how?_

After days of searching, and researching (and the homelab server, _mentioned earlier,_ crashing a **few** times), it became apparent that GitHub pages was a good fit, and I wasn't reinventing the wheel. _no-brainer, really_.

So, to the first part of the post title; GitHub pages runs Jekyll by default. Lets have a quick look at Jekyll, and GitHub pages:
+ Jekyll is open source [^1]
+ "Blogging is baked into Jekyll" [^2]
+  Posts can be written in markdown [^2]
   + Markdown makes posts easier to read, when viewing raw/unrendered (in my opinion), and is supported in many other programs/applications, if ever needed
+ GitHub pages are free to host static web pages [^3]
+ GitHub is owned by Microsoft [^4], so its sizable, and stable

All these points fulfil my requirements for this project; 'nice-to-have' functionality like ease of posting, search-on-demand, and a CMS are completely trumped by the cost (or lack thereof), and potentionl hosting uptime. Obviously, to post I will need to clone my repository

> git clone https://github.com/dhitchenor/dale.hitchenor.com

then, add/change the necessary posts/files, and ultimately, push back to the repository.

> git add .

> git commit -m "Some awesome comment"

> git push -u origin main

but once I'm use to this workflow (I use git, at least, a few times a week), this blog/portfolio will solve the very large problem.

Oh, and before I forget.. the dark-poole theme! Super basic theme, that has almost everything working, already. A day of customizing, and it was ready to go.. another _no-brainer_ :)



***References:***

[^1]: <https://github.com/jekyll/jekyll?tab=MIT-1-ov-file#readme> 'Jekyll License on GitHub'

[^2]: <https://jekyllrb.com/docs/posts/> 'Posts - Jekyll Documentation'

[^3]: <https://pages.github.com/> 'GitHub Pages'

[^4]: <https://techcrunch.com/2018/06/04/microsoft-has-acquired-github-for-7-5b-in-microsoft-stock/> 'Microsoft acquires Github - TechCrunch'
