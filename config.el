;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Matt Briggs"
  user-mail-address "matt@mattbriggs.net")

(setq doom-font (font-spec :family "Menlo" :size 18))
(setq doom-big-font (font-spec :family "Menlo" :size 28))
(setq doom-theme 'doom-one)

(setq org-directory "~/org/")

(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
