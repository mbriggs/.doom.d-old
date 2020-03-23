;;; lang/javascript+/config.el -*- lexical-binding: t; -*-

(add-hook! typescript-mode 'add-node-modules-path)
(add-hook! typescript-mode (require 'prettier-js))

(setq
  lsp-ui-sideline-show-diagnostics nil
  lsp-ui-sideline-show-hover nil
  lsp-ui-sideline-show-code-actions nil)

(map!
  (:map typescript-mode-map
    :localleader
    "p" #'prettier-js
    "m" #'lsp-ui-sideline-apply-code-actions)
  (:map web-mode-map
    :localleader
    "p" #'prettier-js))
