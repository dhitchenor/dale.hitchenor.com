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
    "Go",
    "Python",
    "C / Embedded",
    "Docker / Podman",
    "FreeCAD",
    "Linux (Debian, AlmaLinux, ArchLinux)",
)
PREFACE_NOW_LABEL = 'Now'           # optional, defaults to 'Now'
PREFACE_NOW = "Building a user submitted database for verifying apps"
PREFACE_PROJECTS_LABEL = 'Notable Projects'
PREFACE_PROJECTS = (
    ("Hubzilla Docker Image", "https://github.com/dhitchenor/hubzilla"),
    ("Disroot Android App", "https://git.disroot.org/disroot/disapp"),
    ("Pelican Typst Plugin", "https://github.com/dhitchenor/pelican-typst"),
    ("Meridian Theme for Pelican", "https://github.com/dhitchenor/pelican-meridian-theme"),
    ("rper - recursive permissions utility", "https://github.com/dhitchenor/rper"),
    ("EcCal - Diary and Calendar", "https://github.com/dhitchenor/eccal"),
    ("Shutdown GUI - Auto-shutdown utility for Linux", "https://github.com/dhitchenor/shutdowngui"),
)
PREFACE_PROJECTS_LINES = 4

DISPLAY_PAGES_ON_MENU = True
# MENUITEMS = (("About", "about/"),)

SOCIAL = (
    ("Github", "https://github.com/dhitchenor"),
    ("LinkedIn", "https://www.linkedin.com/in/dale-hitchenor/"),
    ("Social", "https://fe.disroot.org/@dhitchenor"),
    ("XMPP", "https://invite.joinjabber.org/#dhitchenor@disroot.org"),
)

COPYRIGHT_YEAR = 2026
DEFAULT_FEATURES = 3
DEFAULT_FEATURE_ORDER = 'desc'
DEFAULT_PAGINATION = 5
