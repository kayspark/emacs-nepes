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

     ;; Core hues — WCAG-refined
     (blue          "#23438E")
     (blue-warmer   "#2E55B0")
     (blue-cooler   "#1B3470")
     (blue-faint    "#2E55B0")
     (blue-intense  "#1B3470")

     (red           "#C4181F")
     (red-warmer    "#D4252C")
     (red-cooler    "#9E1319")
     (red-faint     "#D4252C")
     (red-intense   "#9E1319")

     (green         "#2A8030")
     (green-warmer  "#43AD49")
     (green-cooler  "#246C29")
     (green-faint   "#43AD49")
     (green-intense "#246C29")

     (yellow        "#866E1C")
     (yellow-warmer "#D08A10")
     (yellow-cooler "#7C6519")
     (yellow-faint  "#FEA413")
     (yellow-intense "#C9A63E")

     (magenta       "#7A4FA0")
     (magenta-warmer "#9B6ABF")
     (magenta-cooler "#613E80")
     (magenta-faint "#9B6ABF")
     (magenta-intense "#613E80")

     (cyan          "#2D7A82")
     (cyan-warmer   "#3A9BA5")
     (cyan-cooler   "#236068")
     (cyan-faint    "#3A9BA5")
     (cyan-intense  "#236068")

     ;; Utility (mapped to palette_data.py surface tokens)
     (bg-completion "#B8D0F0")
     (bg-hover      "#D8D7D7")
     (bg-hover-secondary "#E7E6E6")
     (bg-hl-line    "#F0F0F0")

     ;; Diff backgrounds (best-effort derived colors)
     (bg-added          "#1E2E1E")
     (bg-added-faint    "#192619")
     (bg-added-refine   "#2A4A2A")
     (bg-removed        "#2E1E1E")
     (bg-removed-faint  "#261919")
     (bg-removed-refine "#4A2A2A")
     (bg-changed        "#2E2E1E")
     (bg-changed-faint  "#262619")
     (bg-changed-refine "#4A4A2A")

     ;; Subtle backgrounds for regions, prompts
     (bg-red-subtle     "#3A1C1C")
     (bg-green-subtle   "#1C2E1C")
     (bg-yellow-subtle  "#2E2A1C")
     (bg-blue-subtle    "#1C2040")
     (bg-magenta-subtle "#2E1C30")
     (bg-cyan-subtle    "#1C2E30")

     ;; Nuanced backgrounds (lighter tint)
     (bg-red-nuanced     "#2C1414")
     (bg-green-nuanced   "#142214")
     (bg-yellow-nuanced  "#221E14")
     (bg-blue-nuanced    "#141828")
     (bg-magenta-nuanced "#221422")
     (bg-cyan-nuanced    "#142222")

     ;; Intense backgrounds
     (bg-red-intense     "#9E1319")
     (bg-green-intense   "#246C29")
     (bg-yellow-intense  "#99640B")
     (bg-blue-intense    "#1B3470")
     (bg-magenta-intense "#613E80")
     (bg-cyan-intense    "#236068")
   )
   'warm)
  "Core palette for `nepes-light`.")

;;; Layer 2: User palette (empty, for user overrides)

(defvar nepes-light-palette-user nil
  "User overrides for `nepes-light' palette.")

;;; Layer 3: Semantic overrides (mappings)

(defvar nepes-light-palette-overrides
  `(;; Syntax
    (keyword blue-cooler)
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
    (fg-added-intense green-warmer)
    (fg-changed yellow-warmer)
    (fg-changed-intense yellow-intense)
    (fg-removed red)
    (fg-removed-intense red-warmer)

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
    (bg-paren-match "#504848")

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
  "Nepes corporate light theme."
  'light
  'nepes-light-palette
  'nepes-light-palette-user
  'nepes-light-palette-overrides)

(provide-theme 'nepes-light)
;;; nepes-light-theme.el ends here
