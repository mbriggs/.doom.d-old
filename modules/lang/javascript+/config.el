;;; lang/javascript+/config.el -*- lexical-binding: t; -*-

(add-hook! typescript-mode 'add-node-modules-path)
(add-hook! typescript-mode (require 'prettier-js))

(setq lsp-typescript-suggestion-actions-enabled nil)

(map!
  (:map typescript-mode-map
    :localleader
    "p" #'prettier-js
    "m" #'lsp-ui-sideline-apply-code-actions)
  (:map web-mode-map
    :localleader
    "p" #'prettier-js))
