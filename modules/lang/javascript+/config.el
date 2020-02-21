;;; lang/javascript+/config.el -*- lexical-binding: t; -*-

(add-hook! tide-mode 'add-node-modules-path)
(add-hook! tide-mode 'prettier-js)


(setq tide-disable-suggestions t)

(map! (:map tide-mode-map
        :localleader "p" #'prettier-js
        :localleader "j" #'mb/tide-mjs
        :localleader "J" #'mb/tide-local
        :localleader "m" #'tide-fix))
