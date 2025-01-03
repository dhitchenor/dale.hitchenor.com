AUTHOR = "Dale Hitchenor"
SITENAME = "Dale Hitchenor"
SITESUBTITLE = "Turning ideas into code and machines"

SITEURL = "https://dale.hitchenor.com"

PATH = "content"
TIMEZONE = "Australia/Brisbane"
DEFAULT_LANG = "en"

PLUGINS = ["typst"]

THEME = "./pelican-meridian-theme"
FAVICON = "favicon.png"

THEME_TEMPLATES_OVERRIDES = ["theme_overrides"]
STATIC_PATHS = ['extra/favicon.png']
EXTRA_PATH_METADATA = {'extra/favicon.png': {'path': 'favicon.png'}}

# DIRECT_TEMPLATES = ("index", "preface", "about", "archives", "404")
DIRECT_TEMPLATES = ("index", "preface", "archives", "404")
PREFACE_URL = ""
PREFACE_SAVE_AS = "index.html"
INDEX_URL = "posts/"
INDEX_SAVE_AS = "posts/index.html"
ARCHIVES_URL = "archives/"
ARCHIVES_SAVE_AS = "archives/index.html"
# ABOUT_URL = "about/"
# ABOUT_SAVE_AS = "about/index.html"

PREFACE_TAGLINE = "Studying Electrical Engineering, Working as a Medical Professional"
PREFACE_BLURB = "I'm an aspiring engineer with a passion for software development, robotics, and embedded systems. I enjoy designing practical solutions that bridge software and hardware, whether that's building applications, experimenting with electronics, or exploring new technologies. Every project is an opportunity to learn, refine my skills, and create something useful."
PREFACE_SKILLS = (
    "Flutter / Dart",
    "Kotlin / Android",
    "Python",
    "C / Embedded",
    "Docker / Podman",
    "FreeCAD",
    "Linux (Debian, AlmaLinux, ArchLinux)",
)
PREFACE_NOW = "Building a bracket extension to support solar panels, to compliment a self sustaining security system for family"

DISPLAY_PAGES_ON_MENU = True
# MENUITEMS = (("About", "about/"),)

SOCIAL = (
    ("Github", "https://github.com/dhitchenor"),
    ("Disroot Git", "https://git.disroot.org/dhitchenor"),
    ("Framagit", "https://framagit.org/dhitchenor"),
    ("LinkedIn", "https://www.linkedin.com/in/dale-hitchenor/"),
    ("Social", "https://fe.disroot.org/@dhitchenor"),
    ("XMPP", "https://invite.joinjabber.org/#dhitchenor@disroot.org"),
)

COPYRIGHT_YEAR = 2026

FEATURED_PROJECTS = (
    {
        "name": "Pelican Typst Plugin",
        "url": "/why-pelican-typst.html",
        "desc": "A pelican plugin, to render typst files; created for this website",
        "tags": ("python", "html", "css", "js"),
    },
)

DEFAULT_PAGINATION = 5
