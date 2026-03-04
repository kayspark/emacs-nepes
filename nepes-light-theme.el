;;; nepes-light-theme.el --- Nepes light theme -*- lexical-binding: t; -*-

;; Author: kaypark
;; URL: https://github.com/kayspark/emacs-nepes

;;; Commentary:

;; Light variant of the Nepes corporate colorscheme.
;; Requires `nepes-themes' for shared infrastructure.

;;; Code:

(require 'nepes-themes)

(deftheme nepes-light "Nepes corporate light theme.")

(let ((class '((class color) (min-colors 256)))
      ;; Named colors
      (bg-deep "#FFFFFF") (bg "#F8F8F8") (bg-dim "#F0F0F0")
      (bg-alt "#E7E6E6") (bg-hl "#D8D7D7") (bg-overlay "#C9C8C8")
      (fg "#1C1C1E") (fg-dim "#3A3A3E") (fg-subtle "#5A5A64") (fg-muted "#7A7A84")
      (blue "#23438E") (blue-dim "#1B3470") (blue-bright "#2E55B0")
      (red "#C4181F") (red-dim "#9E1319") (red-bright "#D4252C")
      (green "#2E8A34") (green-dim "#246C29") (green-bright "#43AD49")
      (orange "#D08A10") (orange-dim "#A86E0D") (orange-bright "#FEA413")
      (magenta "#7A4FA0") (magenta-dim "#613E80") (magenta-bright "#9B6ABF")
      (cyan "#2D7A82") (cyan-dim "#236068") (cyan-bright "#3A9BA5")
      (yellow "#9A7E20") (yellow-dim "#7C6519") (yellow-bright "#C9A63E")
      (cursor "#1C1C1E") (selection "#B8D0F0") (border "#D8D7D7") (comment "#7A7A84")
      ;; Heading colors (rainbow)
      (heading1 "#23438E") (heading2 "#7A4FA0") (heading3 "#2D7A82")
      (heading4 "#2E8A34") (heading5 "#D08A10") (heading6 "#C4181F")
      (heading7 "#9A7E20") (heading8 "#2E55B0"))

  (let ((h1-attrs (nepes-themes--heading-attributes 1))
        (h2-attrs (nepes-themes--heading-attributes 2))
        (h3-attrs (nepes-themes--heading-attributes 3))
        (h4-attrs (nepes-themes--heading-attributes 4))
        (h5-attrs (nepes-themes--heading-attributes 5))
        (h6-attrs (nepes-themes--heading-attributes 6))
        (h7-attrs (nepes-themes--heading-attributes 7))
        (h8-attrs (nepes-themes--heading-attributes 8)))

    (custom-theme-set-faces
     'nepes-light

     ;; --- Basic ---
     `(default ((,class :background ,bg :foreground ,fg)))
     `(cursor ((,class :background ,cursor)))
     `(region ((,class :background ,selection :extend t)))
     `(highlight ((,class :background ,bg-hl)))
     `(hl-line ((,class :background ,bg-dim)))
     `(fringe ((,class :background ,bg)))
     `(vertical-border ((,class :foreground ,border)))
     `(window-divider ((,class :foreground ,border)))
     `(window-divider-first-pixel ((,class :foreground ,bg)))
     `(window-divider-last-pixel ((,class :foreground ,bg)))
     `(border ((,class :foreground ,border)))
     `(shadow ((,class :foreground ,fg-muted)))
     `(link ((,class :foreground ,blue :underline t)))
     `(link-visited ((,class :foreground ,magenta :underline t)))
     `(escape-glyph ((,class :foreground ,orange)))
     `(homoglyph ((,class :foreground ,orange)))
     `(minibuffer-prompt ((,class :foreground ,blue :weight bold)))
     `(success ((,class :foreground ,green :weight bold)))
     `(warning ((,class :foreground ,orange :weight bold)))
     `(error ((,class :foreground ,red :weight bold)))

     ;; --- Line numbers ---
     `(line-number ((,class :foreground ,fg-muted :background ,bg)))
     `(line-number-current-line ((,class :foreground ,orange :weight bold :background ,bg-dim)))

     ;; --- Search ---
     `(isearch ((,class :background ,orange :foreground ,bg-deep :weight bold)))
     `(lazy-highlight ((,class :background ,bg-hl :foreground ,fg)))
     `(isearch-fail ((,class :background ,red-dim :foreground ,bg-deep)))
     `(match ((,class :background ,selection :foreground ,fg)))

     ;; --- Mode line ---
     `(mode-line ((,class :background ,bg-alt :foreground ,fg :box (:line-width 1 :color ,border))))
     `(mode-line-inactive ((,class :background ,bg-dim :foreground ,fg-muted :box (:line-width 1 :color ,bg-dim))))
     `(mode-line-emphasis ((,class :foreground ,blue :weight bold)))
     `(mode-line-highlight ((,class :background ,bg-hl)))
     `(mode-line-buffer-id ((,class :foreground ,blue :weight bold)))
     `(header-line ((,class :background ,bg-dim :foreground ,fg)))

     ;; --- Tab bar ---
     `(tab-bar ((,class :background ,bg-deep :foreground ,fg-muted)))
     `(tab-bar-tab ((,class :background ,bg :foreground ,fg :weight bold :box (:line-width 1 :color ,blue-dim))))
     `(tab-bar-tab-inactive ((,class :background ,bg-deep :foreground ,fg-muted)))

     ;; --- Completion ---
     `(completions-common-part ((,class :foreground ,blue :weight bold)))
     `(completions-first-difference ((,class :foreground ,orange)))

     ;; --- Font lock (syntax) ---
     `(font-lock-comment-face ((,class :foreground ,comment :slant italic)))
     `(font-lock-comment-delimiter-face ((,class :foreground ,comment :slant italic)))
     `(font-lock-string-face ((,class :foreground ,green)))
     `(font-lock-doc-face ((,class :foreground ,green-dim :slant italic)))
     `(font-lock-keyword-face ((,class :foreground ,blue)))
     `(font-lock-builtin-face ((,class :foreground ,blue-bright)))
     `(font-lock-function-name-face ((,class :foreground ,cyan)))
     `(font-lock-function-call-face ((,class :foreground ,cyan)))
     `(font-lock-variable-name-face ((,class :foreground ,fg)))
     `(font-lock-variable-use-face ((,class :foreground ,fg)))
     `(font-lock-type-face ((,class :foreground ,magenta)))
     `(font-lock-constant-face ((,class :foreground ,orange)))
     `(font-lock-number-face ((,class :foreground ,orange)))
     `(font-lock-preprocessor-face ((,class :foreground ,magenta-dim)))
     `(font-lock-negation-char-face ((,class :foreground ,red)))
     `(font-lock-warning-face ((,class :foreground ,orange :weight bold)))
     `(font-lock-regexp-face ((,class :foreground ,green-bright)))
     `(font-lock-escape-face ((,class :foreground ,orange)))
     `(font-lock-property-name-face ((,class :foreground ,fg-dim)))
     `(font-lock-property-use-face ((,class :foreground ,fg-dim)))
     `(font-lock-operator-face ((,class :foreground ,fg-subtle)))
     `(font-lock-punctuation-face ((,class :foreground ,fg-subtle)))
     `(font-lock-bracket-face ((,class :foreground ,fg-subtle)))
     `(font-lock-delimiter-face ((,class :foreground ,fg-subtle)))
     `(font-lock-misc-punctuation-face ((,class :foreground ,fg-subtle)))

     ;; --- Diff ---
     `(diff-added ((,class :background "#E8F5E8" :foreground ,green)))
     `(diff-removed ((,class :background "#F5E8E8" :foreground ,red)))
     `(diff-changed ((,class :background "#F5F0E0" :foreground ,orange)))
     `(diff-header ((,class :background ,bg-alt :foreground ,blue :weight bold)))
     `(diff-file-header ((,class :background ,bg-alt :foreground ,blue :weight bold)))
     `(diff-hunk-header ((,class :background ,bg-hl :foreground ,magenta)))
     `(diff-indicator-added ((,class :foreground ,green :weight bold)))
     `(diff-indicator-removed ((,class :foreground ,red :weight bold)))
     `(diff-indicator-changed ((,class :foreground ,orange :weight bold)))
     `(diff-refine-added ((,class :background "#C8E8C8" :foreground ,green-dim)))
     `(diff-refine-removed ((,class :background "#E8C8C8" :foreground ,red-dim)))
     `(diff-refine-changed ((,class :background "#E8E0C0" :foreground ,orange-dim)))

     ;; --- Org mode ---
     `(org-level-1 ((,class :foreground ,heading1 ,@h1-attrs)))
     `(org-level-2 ((,class :foreground ,heading2 ,@h2-attrs)))
     `(org-level-3 ((,class :foreground ,heading3 ,@h3-attrs)))
     `(org-level-4 ((,class :foreground ,heading4 ,@h4-attrs)))
     `(org-level-5 ((,class :foreground ,heading5 ,@h5-attrs)))
     `(org-level-6 ((,class :foreground ,heading6 ,@h6-attrs)))
     `(org-level-7 ((,class :foreground ,heading7 ,@h7-attrs)))
     `(org-level-8 ((,class :foreground ,heading8 ,@h8-attrs)))
     `(org-document-title ((,class :foreground ,blue-dim :weight bold :height 1.8)))
     `(org-document-info ((,class :foreground ,fg-dim)))
     `(org-document-info-keyword ((,class :foreground ,fg-muted)))
     `(org-meta-line ((,class :foreground ,fg-muted)))
     `(org-block ((,class :background ,bg-deep :extend t)))
     `(org-block-begin-line ((,class :foreground ,fg-muted :background ,bg-dim :extend t)))
     `(org-block-end-line ((,class :foreground ,fg-muted :background ,bg-dim :extend t)))
     `(org-code ((,class :foreground ,green :inherit fixed-pitch)))
     `(org-verbatim ((,class :foreground ,orange :inherit fixed-pitch)))
     `(org-table ((,class :foreground ,fg :inherit fixed-pitch)))
     `(org-formula ((,class :foreground ,orange)))
     `(org-todo ((,class :foreground ,red :weight bold)))
     `(org-done ((,class :foreground ,green :weight bold)))
     `(org-headline-done ((,class :foreground ,fg-muted)))
     `(org-date ((,class :foreground ,cyan :underline t)))
     `(org-link ((,class :foreground ,blue :underline t)))
     `(org-tag ((,class :foreground ,fg-muted :weight normal)))
     `(org-priority ((,class :foreground ,orange)))
     `(org-checkbox ((,class :foreground ,blue :weight bold)))
     `(org-ellipsis ((,class :foreground ,fg-muted :underline nil)))
     `(org-drawer ((,class :foreground ,fg-muted)))
     `(org-special-keyword ((,class :foreground ,fg-muted)))

     ;; --- Markdown ---
     `(markdown-header-face-1 ((,class :foreground ,heading1 ,@h1-attrs)))
     `(markdown-header-face-2 ((,class :foreground ,heading2 ,@h2-attrs)))
     `(markdown-header-face-3 ((,class :foreground ,heading3 ,@h3-attrs)))
     `(markdown-header-face-4 ((,class :foreground ,heading4 ,@h4-attrs)))
     `(markdown-header-face-5 ((,class :foreground ,heading5 ,@h5-attrs)))
     `(markdown-header-face-6 ((,class :foreground ,heading6 ,@h6-attrs)))
     `(markdown-code-face ((,class :background ,bg-deep :inherit fixed-pitch)))
     `(markdown-inline-code-face ((,class :foreground ,green :inherit fixed-pitch)))
     `(markdown-link-face ((,class :foreground ,blue :underline t)))
     `(markdown-url-face ((,class :foreground ,cyan :underline t)))

     ;; --- Treesitter ---
     `(tree-sitter-hl-face:keyword ((,class :foreground ,blue)))
     `(tree-sitter-hl-face:function ((,class :foreground ,cyan)))
     `(tree-sitter-hl-face:function.call ((,class :foreground ,cyan)))
     `(tree-sitter-hl-face:string ((,class :foreground ,green)))
     `(tree-sitter-hl-face:type ((,class :foreground ,magenta)))
     `(tree-sitter-hl-face:variable ((,class :foreground ,fg)))
     `(tree-sitter-hl-face:variable.builtin ((,class :foreground ,orange)))
     `(tree-sitter-hl-face:constant ((,class :foreground ,orange)))
     `(tree-sitter-hl-face:constant.builtin ((,class :foreground ,orange-bright)))
     `(tree-sitter-hl-face:number ((,class :foreground ,orange)))
     `(tree-sitter-hl-face:operator ((,class :foreground ,fg-subtle)))
     `(tree-sitter-hl-face:comment ((,class :foreground ,comment :slant italic)))
     `(tree-sitter-hl-face:property ((,class :foreground ,fg-dim)))
     `(tree-sitter-hl-face:punctuation ((,class :foreground ,fg-subtle)))
     `(tree-sitter-hl-face:tag ((,class :foreground ,blue)))

     ;; --- Diagnostics (flymake / flycheck) ---
     `(flymake-error ((,class :underline (:style wave :color ,red))))
     `(flymake-warning ((,class :underline (:style wave :color ,orange))))
     `(flymake-note ((,class :underline (:style wave :color ,blue))))
     `(flycheck-error ((,class :underline (:style wave :color ,red))))
     `(flycheck-warning ((,class :underline (:style wave :color ,orange))))
     `(flycheck-info ((,class :underline (:style wave :color ,blue))))

     ;; --- Eglot / LSP ---
     `(eglot-highlight-symbol-face ((,class :background ,bg-hl)))
     `(eglot-inlay-hint-face ((,class :foreground ,fg-muted :slant italic :height 0.9)))

     ;; --- Magit ---
     `(magit-section-heading ((,class :foreground ,blue :weight bold)))
     `(magit-section-highlight ((,class :background ,bg-dim)))
     `(magit-branch-local ((,class :foreground ,cyan)))
     `(magit-branch-remote ((,class :foreground ,green)))
     `(magit-tag ((,class :foreground ,orange)))
     `(magit-hash ((,class :foreground ,fg-muted)))
     `(magit-diff-added ((,class :background "#E8F5E8" :foreground ,green)))
     `(magit-diff-added-highlight ((,class :background "#C8E8C8" :foreground ,green-dim)))
     `(magit-diff-removed ((,class :background "#F5E8E8" :foreground ,red)))
     `(magit-diff-removed-highlight ((,class :background "#E8C8C8" :foreground ,red-dim)))
     `(magit-diff-context ((,class :foreground ,fg-dim)))
     `(magit-diff-context-highlight ((,class :background ,bg-dim :foreground ,fg-dim)))
     `(magit-diff-hunk-heading ((,class :background ,bg-hl :foreground ,fg)))
     `(magit-diff-hunk-heading-highlight ((,class :background ,bg-overlay :foreground ,fg :weight bold)))
     `(magit-diffstat-added ((,class :foreground ,green)))
     `(magit-diffstat-removed ((,class :foreground ,red)))
     `(magit-log-author ((,class :foreground ,orange)))
     `(magit-log-date ((,class :foreground ,fg-muted)))

     ;; --- Vertico / Corfu / Consult ---
     `(vertico-current ((,class :background ,selection :extend t)))
     `(corfu-default ((,class :background ,bg-alt)))
     `(corfu-current ((,class :background ,selection)))
     `(corfu-border ((,class :background ,border)))
     `(corfu-bar ((,class :background ,blue)))
     `(orderless-match-face-0 ((,class :foreground ,blue :weight bold)))
     `(orderless-match-face-1 ((,class :foreground ,magenta :weight bold)))
     `(orderless-match-face-2 ((,class :foreground ,cyan :weight bold)))
     `(orderless-match-face-3 ((,class :foreground ,green :weight bold)))
     `(consult-preview-match ((,class :background ,selection)))

     ;; --- Which-key ---
     `(which-key-key-face ((,class :foreground ,blue :weight bold)))
     `(which-key-group-description-face ((,class :foreground ,magenta)))
     `(which-key-command-description-face ((,class :foreground ,fg)))
     `(which-key-separator-face ((,class :foreground ,fg-muted)))

     ;; --- Doom modeline ---
     `(doom-modeline-bar ((,class :background ,blue-dim)))
     `(doom-modeline-bar-inactive ((,class :background ,bg-alt)))
     `(doom-modeline-buffer-file ((,class :foreground ,fg :weight bold)))
     `(doom-modeline-buffer-major-mode ((,class :foreground ,blue :weight bold)))
     `(doom-modeline-buffer-minor-mode ((,class :foreground ,fg-muted)))
     `(doom-modeline-buffer-modified ((,class :foreground ,orange :weight bold)))
     `(doom-modeline-evil-insert-state ((,class :foreground ,green)))
     `(doom-modeline-evil-normal-state ((,class :foreground ,blue)))
     `(doom-modeline-evil-visual-state ((,class :foreground ,magenta)))
     `(doom-modeline-evil-replace-state ((,class :foreground ,red)))
     `(doom-modeline-evil-operator-state ((,class :foreground ,cyan)))
     `(doom-modeline-evil-emacs-state ((,class :foreground ,orange)))
     `(doom-modeline-info ((,class :foreground ,green)))
     `(doom-modeline-warning ((,class :foreground ,orange)))
     `(doom-modeline-urgent ((,class :foreground ,red)))
     `(doom-modeline-project-dir ((,class :foreground ,blue)))

     ;; --- Diff-hl ---
     `(diff-hl-insert ((,class :foreground ,green :background "#E8F5E8")))
     `(diff-hl-delete ((,class :foreground ,red :background "#F5E8E8")))
     `(diff-hl-change ((,class :foreground ,orange :background "#F5F0E0")))

     ;; --- Embark ---
     `(embark-keybinding ((,class :foreground ,blue :weight bold)))

     ;; --- Show-paren ---
     `(show-paren-match ((,class :foreground ,orange :background ,bg-hl :weight bold)))
     `(show-paren-mismatch ((,class :foreground ,bg-deep :background ,red :weight bold)))

     ;; --- Whitespace ---
     `(whitespace-trailing ((,class :background ,red-dim)))
     `(whitespace-tab ((,class :foreground ,bg-hl)))
     `(whitespace-space ((,class :foreground ,bg-hl)))

     ;; --- Ansi colors (for term/vterm/shell) ---
     `(ansi-color-black ((,class :foreground ,fg :background ,fg)))
     `(ansi-color-red ((,class :foreground ,red :background ,red)))
     `(ansi-color-green ((,class :foreground ,green :background ,green)))
     `(ansi-color-yellow ((,class :foreground ,orange :background ,orange)))
     `(ansi-color-blue ((,class :foreground ,blue :background ,blue)))
     `(ansi-color-magenta ((,class :foreground ,magenta :background ,magenta)))
     `(ansi-color-cyan ((,class :foreground ,cyan :background ,cyan)))
     `(ansi-color-white ((,class :foreground ,fg-dim :background ,fg-dim)))
     `(ansi-color-bright-black ((,class :foreground ,fg-muted :background ,fg-muted)))
     `(ansi-color-bright-red ((,class :foreground ,red-bright :background ,red-bright)))
     `(ansi-color-bright-green ((,class :foreground ,green-bright :background ,green-bright)))
     `(ansi-color-bright-yellow ((,class :foreground ,orange-bright :background ,orange-bright)))
     `(ansi-color-bright-blue ((,class :foreground ,blue-bright :background ,blue-bright)))
     `(ansi-color-bright-magenta ((,class :foreground ,magenta-bright :background ,magenta-bright)))
     `(ansi-color-bright-cyan ((,class :foreground ,cyan-bright :background ,cyan-bright)))
     `(ansi-color-bright-white ((,class :foreground ,bg-deep :background ,bg-deep)))
     )))

(provide-theme 'nepes-light)
;;; nepes-light-theme.el ends here
