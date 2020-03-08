;;; lang/javascript+/config.el -*- lexical-binding: t; -*-

(add-hook! tide-mode 'add-node-modules-path)
(add-hook! tide-mode (require 'prettier-js))

(setq tide-disable-suggestions t)

(map! (:map tide-mode-map
        :localleader
        "p" #'prettier-js
        "J" #'mb/tide-local
        "m" #'tide-fix))
