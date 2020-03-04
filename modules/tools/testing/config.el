;;; tools/testing/config.el -*- lexical-binding: t; -*-


(map! (:map tide-mode-map
        :localleader
        "t" #'mb/test-bench-ts))

(set-popup-rule! "*compilation*" :ignore t)
