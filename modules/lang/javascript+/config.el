;;; lang/javascript+/config.el -*- lexical-binding: t; -*-

(add-hook! typescript-mode 'add-node-modules-path)
(add-hook! typescript-mode (require 'prettier-js))

(map!
  (:map typescript-mode-map
    :localleader
    "p" #'prettier-js
    "m" #'lsp-ui-sideline-apply-code-actions)
  (:map web-mode-map
    :localleader
    "p" #'prettier-js))

(setq lsp-clients-typescript-log-verbosity "debug"
      lsp-clients-typescript-plugins
      (vector
       (list :name "typescript-tslint-plugin"
             :location "/usr/lib/node_modules/typescript-tslint-plugin")))
