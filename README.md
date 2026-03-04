# emacs-nepes

Corporate colorscheme for Emacs derived from the Nepes LaTeX template brand colors.

Provides two themes: `nepes-dark` and `nepes-light`.

## Installation

### Manual

Clone this repository and add it to your `custom-theme-load-path`:

```elisp
(add-to-list 'custom-theme-load-path "~/path/to/emacs-nepes")
(load-theme 'nepes-dark t)
```

### use-package (with straight or elpaca)

```elisp
(use-package nepes-themes
  :straight (:host github :repo "kayspark/emacs-nepes")
  :config
  (load-theme 'nepes-dark t))
```

## Usage

Load either theme:

```elisp
(load-theme 'nepes-dark t)
;; or
(load-theme 'nepes-light t)
```

Toggle between dark and light:

```
M-x nepes-themes-toggle
```

## Customization

### Mixed fonts

When `nepes-themes-mixed-fonts` is non-nil, code-related faces inherit
`fixed-pitch`, allowing proportional fonts for prose and monospace for code.

```elisp
(setq nepes-themes-mixed-fonts t)
```

### Variable-pitch UI

When `nepes-themes-variable-pitch-ui` is non-nil, UI elements use
`variable-pitch`.

```elisp
(setq nepes-themes-variable-pitch-ui t)
```

### Heading styles

Control heading font sizes and styles per level:

```elisp
(setq nepes-themes-headings
      '((1 . (variable-pitch 1.5))
        (2 . (variable-pitch 1.4))
        (3 . (variable-pitch 1.3))
        (t . (variable-pitch 1.1))))
```

Values are lists that can include `variable-pitch`, `bold`, and a height
multiplier (number).

## Supported packages

- Org mode, Markdown
- Magit
- Vertico, Corfu, Consult, Orderless, Embark
- Which-key
- Doom modeline
- Eglot
- Flymake, Flycheck
- Diff-hl
- Tree-sitter
- Show-paren, Whitespace
- Ansi colors (vterm, shell)

## Color palette

### Dark

| Role    | Base      | Dim       | Bright    |
|---------|-----------|-----------|-----------|
| Blue    | `#4A6ABF` | `#23438E` | `#6B8AD8` |
| Red     | `#D4252C` | `#A81E23` | `#E85B61` |
| Green   | `#43AD49` | `#348A3A` | `#6BCF70` |
| Orange  | `#FEA413` | `#CC8410` | `#FFBD4A` |
| Magenta | `#9B6ABF` | `#7A4FA0` | `#BB8EDA` |
| Cyan    | `#3A9BA5` | `#2D7A82` | `#5CBDC7` |
| Yellow  | `#E8C55A` | `#C9A63E` | `#F5DA7F` |

Background: `#1C1C1E` / Foreground: `#D8D8DC`

### Light

| Role    | Base      | Dim       | Bright    |
|---------|-----------|-----------|-----------|
| Blue    | `#23438E` | `#1B3470` | `#2E55B0` |
| Red     | `#C4181F` | `#9E1319` | `#D4252C` |
| Green   | `#2E8A34` | `#246C29` | `#43AD49` |
| Orange  | `#D08A10` | `#A86E0D` | `#FEA413` |
| Magenta | `#7A4FA0` | `#613E80` | `#9B6ABF` |
| Cyan    | `#2D7A82` | `#236068` | `#3A9BA5` |
| Yellow  | `#9A7E20` | `#7C6519` | `#C9A63E` |

Background: `#F8F8F8` / Foreground: `#1C1C1E`

## License

GPL-3.0-or-later
