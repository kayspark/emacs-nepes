;;; nepes-light-theme.el --- Nepes light theme (modus derivative) -*- lexical-binding: t; -*-

;; Author: kaypark
;; URL: https://github.com/kayspark/emacs-nepes

;;; Commentary:

;; Light variant of the Nepes corporate colorscheme.
;; Built on modus-themes infrastructure for 200+ face coverage.
;; Requires `nepes-themes' for shared infrastructure.

;;; Code:

(require 'nepes-themes)

;;; Layer 1: Core palette (named colors)

(defvar nepes-light-palette
  (modus-themes-generate-palette
   '(;; Backgrounds
     (bg-main  "#F8F8F8")
     (bg-dim   "#F0F0F0")
     (bg-active "#D8D7D7")
     (bg-inactive "#E7E6E6")
     (border  "#D8D7D7")

     ;; Foregrounds
     (fg-main  "#1C1C1E")
     (fg-dim   "#3A3A3E")
     (fg-alt   "#5A5A64")

     ;; Core hues — WCAG-refined for light background
     (blue          "#23438E")
     (blue-warmer   "#2E55B0")
     (blue-cooler   "#1B3470")
     (blue-faint    "#4A6090")
     (blue-intense  "#23438E")

     (red           "#C4181F")
     (red-warmer    "#D4252C")
     (red-cooler    "#9E1319")
     (red-faint     "#A04048")
     (red-intense   "#C4181F")

     (green         "#2A8030")
     (green-warmer  "#43AD49")
     (green-cooler  "#246C29")
     (green-faint   "#408048")
     (green-intense "#2A8030")

     (yellow        "#866E1C")
     (yellow-warmer "#D08A10")
     (yellow-cooler "#7C6519")
     (yellow-faint  "#8A7838")
     (yellow-intense "#C9A63E")

     (magenta       "#7A4FA0")
     (magenta-warmer "#9B6ABF")
     (magenta-cooler "#613E80")
     (magenta-faint "#7A6090")
     (magenta-intense "#7A4FA0")

     (cyan          "#2D7A82")
     (cyan-warmer   "#3A9BA5")
     (cyan-cooler   "#236068")
     (cyan-faint    "#487880")
     (cyan-intense  "#2D7A82")

     ;; Extended named colors
     (rust  "#99640B")
     (gold  "#7C6519")
     (olive "#707079")

     ;; Diff backgrounds
     (bg-added          "#E8F5E8")
     (bg-added-faint    "#F0FAF0")
     (bg-added-refine   "#C8E8C8")
     (bg-removed        "#F5E8E8")
     (bg-removed-faint  "#FAF0F0")
     (bg-removed-refine "#E8C8C8")
     (bg-changed        "#F5F0E0")
     (bg-changed-faint  "#FAF8F0")
     (bg-changed-refine "#E8E0C0")

     ;; Subtle backgrounds
     (bg-red-subtle     "#F5E0E0")
     (bg-green-subtle   "#E0F0E0")
     (bg-yellow-subtle  "#F0ECD0")
     (bg-blue-subtle    "#E0E4F0")
     (bg-magenta-subtle "#EDE0F0")
     (bg-cyan-subtle    "#E0F0F0")

     ;; Nuanced backgrounds
     (bg-red-nuanced     "#FAF0F0")
     (bg-green-nuanced   "#F0FAF0")
     (bg-yellow-nuanced  "#FAF8F0")
     (bg-blue-nuanced    "#F0F2FA")
     (bg-magenta-nuanced "#F5F0FA")
     (bg-cyan-nuanced    "#F0FAFA")

     ;; Intense backgrounds
     (bg-red-intense     "#FF8F88")
     (bg-green-intense   "#6FDF6F")
     (bg-yellow-intense  "#F0D000")
     (bg-blue-intense    "#5580FF")
     (bg-magenta-intense "#C07FFF")
     (bg-cyan-intense    "#60CFCF")

     ;; Special
     (bg-completion "#B8D0F0")
     (bg-hover      "#D8D7D7")
     (bg-hover-secondary "#E7E6E6")
     (bg-hl-line    "#F0F0F0")

     ;; Graphs
     (bg-graph-red-0    "#EF7969")
     (bg-graph-red-1    "#FFAAB4")
     (bg-graph-green-0  "#2CC22C")
     (bg-graph-green-1  "#60E060")
     (bg-graph-yellow-0 "#F0D000")
     (bg-graph-yellow-1 "#F5E870")
     (bg-graph-blue-0   "#2FAFEF")
     (bg-graph-blue-1   "#79B8FF")
     (bg-graph-magenta-0 "#BF94FE")
     (bg-graph-magenta-1 "#E0B0FF"))
   'warm)
  "Core palette for `nepes-light'.")

;;; Layer 2: User palette (empty, for user overrides)

(defvar nepes-light-palette-user nil
  "User overrides for `nepes-light' palette.")

;;; Layer 3: Semantic overrides (mappings)

(defvar nepes-light-palette-overrides
  `(;; Syntax
    (keyword blue)
    (builtin blue-warmer)
    (fnname cyan)
    (string green)
    (type magenta)
    (constant yellow-cooler)
    (variable fg-main)
    (comment fg-alt)
    (docstring green-faint)
    (docmarkup green-faint)

    ;; Operators and delimiters
    (bracket fg-alt)
    (delimiter fg-alt)
    (operator fg-alt)
    (number yellow-cooler)
    (punctuation fg-alt)

    ;; Headings (rainbow)
    (fg-heading-1 blue)
    (fg-heading-2 magenta)
    (fg-heading-3 cyan)
    (fg-heading-4 green)
    (fg-heading-5 yellow)
    (fg-heading-6 red)
    (fg-heading-7 fg-alt)
    (fg-heading-8 blue-warmer)

    ;; Status
    (err red)
    (warning yellow-warmer)
    (info blue)

    ;; Diff/VC
    (fg-added green)
    (fg-added-intense green-cooler)
    (fg-changed yellow-warmer)
    (fg-changed-intense yellow-intense)
    (fg-removed red)
    (fg-removed-intense red-cooler)

    ;; Line numbers
    (fg-line-number-inactive fg-alt)
    (fg-line-number-active fg-dim)
    (bg-line-number-inactive bg-main)
    (bg-line-number-active bg-dim)

    ;; Prompts
    (fg-prompt blue)

    ;; Completion
    (fg-completion-match-0 blue)
    (fg-completion-match-1 magenta)
    (fg-completion-match-2 cyan)
    (fg-completion-match-3 green)

    ;; Paren match
    (fg-paren-match blue)
    (bg-paren-match "#D8D7D7")

    ;; Links
    (underline-link blue)
    (underline-link-visited magenta)

    ;; Region
    (bg-region "#B8D0F0")

    ;; Prose
    (prose-todo red)
    (prose-done green))
  "Semantic palette overrides for `nepes-light'.")

;;; Theme declaration

(modus-themes-theme 'nepes-light
  'nepes
  "Nepes corporate light theme — clean light background with brand colors."
  'light
  'nepes-light-palette
  'nepes-light-palette-user
  'nepes-light-palette-overrides)

(provide-theme 'nepes-light)
;;; nepes-light-theme.el ends here
