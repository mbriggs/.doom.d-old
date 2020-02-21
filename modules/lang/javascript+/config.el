;;; lang/javascript+/config.el -*- lexical-binding: t; -*-

(add-hook! tide-mode 'add-node-modules-path)
(add-hook! tide-mode 'prettier-js)


(setq tide-disable-suggestions t)
