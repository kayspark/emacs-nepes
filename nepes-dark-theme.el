;;; nepes-dark-theme.el --- Nepes dark theme (modus derivative) -*- lexical-binding: t; -*-

;; Author: kaypark
;; URL: https://github.com/kayspark/emacs-nepes

;;; Commentary:

;; Dark variant of the Nepes corporate colorscheme.
;; Built on modus-themes infrastructure for 200+ face coverage.
;; Requires `nepes-themes' for shared infrastructure.

;;; Code:

(require 'nepes-themes)

;;; Layer 1: Core palette (named colors)

(defvar nepes-dark-palette
  (modus-themes-generate-palette
   '(;; Backgrounds
     (bg-main  "#1E1C1A")
     (bg-dim   "#262422")
     (bg-active "#3E3A38")
     (bg-inactive "#2E2C2A")
     (border  "#3E3A38")

     ;; Foregrounds
     (fg-main  "#DCD8D4")
     (fg-dim   "#B6B0AC")
     (fg-alt   "#8A9199")

     ;; Core hues — WCAG-refined
     (blue          "#5C8CFF")
     (blue-warmer   "#6B8AD8")
     (blue-cooler   "#23438E")
     (blue-faint    "#6B8AD8")
     (blue-intense  "#23438E")

     (red           "#FF5C5C")
     (red-warmer    "#E85B61")
     (red-cooler    "#A81E23")
     (red-faint     "#E85B61")
     (red-intense   "#A81E23")

     (green         "#3DDC84")
     (green-warmer  "#6BCF70")
     (green-cooler  "#348A3A")
     (green-faint   "#6BCF70")
     (green-intense "#348A3A")

     (yellow        "#E8C55A")
     (yellow-warmer "#FEA413")
     (yellow-cooler "#C9A63E")
     (yellow-faint  "#FFBD4A")
     (yellow-intense "#F5DA7F")

     (magenta       "#A274C3")
     (magenta-warmer "#BB8EDA")
     (magenta-cooler "#7A4FA0")
     (magenta-faint "#BB8EDA")
     (magenta-intense "#7A4FA0")

     (cyan          "#3A9BA5")
     (cyan-warmer   "#5CBDC7")
     (cyan-cooler   "#2D7A82")
     (cyan-faint    "#5CBDC7")
     (cyan-intense  "#2D7A82")

     ;; Extended named colors
     (rust  "#CC8410")
     (gold  "#C9A63E")
     (olive "#8D847B")

     ;; Special
     (bg-completion "#2E4C7A")
     (bg-hover      "#3E3A38")
     (bg-hover-secondary "#2E2C2A")
     (bg-hl-line    "#262422")

     ;; Diff backgrounds
     (bg-added                 "#1E2E1E")
     (bg-added-faint           "#192619")
     (bg-added-refine          "#2A4A2A")
     (bg-removed               "#2E1E1E")
     (bg-removed-faint         "#261919")
     (bg-removed-refine        "#4A2A2A")
     (bg-changed               "#2E2E1E")
     (bg-changed-faint         "#262619")
     (bg-changed-refine        "#4A4A2A")

     ;; Subtle backgrounds for regions, prompts
     (bg-red-subtle            "#3A1C1C")
     (bg-green-subtle          "#1C2E1C")
     (bg-yellow-subtle         "#2E2A1C")
     (bg-blue-subtle           "#1C2040")
     (bg-magenta-subtle        "#2E1C30")
     (bg-cyan-subtle           "#1C2E30")

     ;; Nuanced backgrounds (lighter tint)
     (bg-red-nuanced           "#2C1414")
     (bg-green-nuanced         "#142214")
     (bg-yellow-nuanced        "#221E14")
     (bg-blue-nuanced          "#141828")
     (bg-magenta-nuanced       "#221422")
     (bg-cyan-nuanced          "#142222")

     ;; Intense backgrounds
     (bg-red-intense     "#A81E23")
     (bg-green-intense   "#348A3A")
     (bg-yellow-intense  "#CC8410")
     (bg-blue-intense    "#23438E")
     (bg-magenta-intense "#7A4FA0")
     (bg-cyan-intense    "#2D7A82")

     ;; Graphs
     (bg-graph-blue-0          "#2FAFEF")
     (bg-graph-blue-1          "#1F2F8F")
     (bg-graph-green-0         "#0FED00")
     (bg-graph-green-1         "#007800")
     (bg-graph-magenta-0       "#BF94FE")
     (bg-graph-magenta-1       "#5F509F")
     (bg-graph-red-0           "#B52C2C")
     (bg-graph-red-1           "#702020")
     (bg-graph-yellow-0        "#F1E00A")
     (bg-graph-yellow-1        "#B08940"))
   'warm)
  "Core palette for `nepes-dark'.")

;;; Layer 2: User palette (empty, for user overrides)

(defvar nepes-dark-palette-user nil
  "User overrides for `nepes-dark' palette.")

;;; Layer 3: Semantic overrides (mappings)

(defvar nepes-dark-palette-overrides
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
    (bg-region "#2E4C7A")

    ;; Prose
    (prose-todo red)
    (prose-done green))
  "Semantic palette overrides for `nepes-dark'.")

;;; Theme declaration

(modus-themes-theme 'nepes-dark
  'nepes
  "Nepes corporate dark theme — warm brownish backgrounds with brand colors."
  'dark
  'nepes-dark-palette
  'nepes-dark-palette-user
  'nepes-dark-palette-overrides)

(provide-theme 'nepes-dark)
;;; nepes-dark-theme.el ends here
