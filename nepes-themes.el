;;; nepes-themes.el --- Nepes corporate colorscheme for Emacs -*- lexical-binding: t; -*-

;; Author: kaypark
;; URL: https://github.com/kayspark/emacs-nepes
;; Version: 2.0.0
;; Package-Requires: ((emacs "28.1"))
;; Keywords: faces, theme

;;; Commentary:

;; Corporate colorscheme derived from Nepes brand identity.
;; Built on modus-themes (built-in since Emacs 28) for comprehensive face coverage.
;;
;; Use `nepes-themes-toggle' to switch between dark and light variants.
;; Customize heading styles with `nepes-themes-headings'.

;;; Code:

(require 'modus-themes)

(defgroup nepes-themes nil
  "Nepes themes."
  :group 'faces
  :prefix "nepes-themes-")

(defcustom nepes-themes-mixed-fonts nil
  "When non-nil, use fixed-pitch for code-related faces."
  :type 'boolean
  :group 'nepes-themes)

(defcustom nepes-themes-variable-pitch-ui nil
  "When non-nil, use variable-pitch for UI elements."
  :type 'boolean
  :group 'nepes-themes)

(defcustom nepes-themes-headings
  '((0 . (variable-pitch 1.6))
    (1 . (variable-pitch 1.5))
    (2 . (variable-pitch 1.4))
    (3 . (variable-pitch 1.3))
    (4 . (variable-pitch 1.2))
    (t . (variable-pitch 1.1)))
  "Heading properties alist.  Keys are heading levels (0-8, t=default).
Values are lists of properties: variable-pitch, bold, height number."
  :type 'alist
  :group 'nepes-themes)

(defcustom nepes-themes-to-toggle '(nepes-dark nepes-light)
  "Themes to toggle between."
  :type '(list symbol symbol)
  :group 'nepes-themes)

(defconst nepes-themes-palette-common
  '((fg-heading-1 blue)
    (fg-heading-2 magenta)
    (fg-heading-3 cyan)
    (fg-heading-4 green)
    (fg-heading-5 yellow)
    (fg-heading-6 red)
    (fg-heading-7 yellow-warmer)
    (fg-heading-8 blue-warmer)
    (keyword blue)
    (builtin blue-warmer)
    (fnname cyan)
    (string green)
    (type magenta)
    (constant yellow-warmer)
    (variable fg-main)
    (comment fg-dim)
    (docstring green-faint)
    (err red)
    (warning yellow-warmer)
    (info blue)
    (fg-added green)
    (fg-changed yellow-warmer)
    (fg-removed red))
  "Common palette mappings shared by all Nepes themes.")

;;;###autoload
(defun nepes-themes-toggle ()
  "Toggle between nepes-dark and nepes-light."
  (interactive)
  (let* ((pair nepes-themes-to-toggle)
         (current (car custom-enabled-themes))
         (next (if (eq current (car pair)) (cadr pair) (car pair))))
    (mapc #'disable-theme custom-enabled-themes)
    (load-theme next :no-confirm)))

(defun nepes-themes--heading-attributes (level)
  "Get face attributes for heading LEVEL from `nepes-themes-headings'."
  (let* ((props (or (alist-get level nepes-themes-headings)
                    (alist-get t nepes-themes-headings)
                    '(1.1)))
         (attrs '(:weight bold)))
    (dolist (prop props)
      (cond
       ((eq prop 'variable-pitch)
        (setq attrs (append attrs '(:inherit variable-pitch))))
       ((numberp prop)
        (setq attrs (append attrs (list :height prop))))))
    attrs))

(provide 'nepes-themes)
;;; nepes-themes.el ends here
