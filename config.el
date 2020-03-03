;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Matt Briggs"
  user-mail-address "matt@mattbriggs.net")

(setq RETINA_SCALE
  (let ((env (getenv "RETINA_SCALE_FACTOR")))
    (if (not env) 1
      (string-to-number env))))

(setq doom-font (font-spec :family "JetBrains Mono" :size (* 18 RETINA_SCALE)))
(setq doom-big-font (font-spec :family "JetBrains Mono" :size (* 24 RETINA_SCALE)))
(setq doom-theme 'doom-one)

(setq org-directory "~/org/")

(+global-word-wrap-mode +1)

(setq prescient-filter-method '(literal initialism))
;; (setq company-dabbrev-downcase 0)
(setq company-idle-delay 0.5)

(setq display-line-numbers-type t)

