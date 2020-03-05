;;; term/vterm+/config.el -*- lexical-binding: t; -*-

;; (after! vterm
;;   (add-hook! vterm-mode-hook
;;     ))

(map!
 (:map vterm-mode-map
   :n "q" #'kill-buffer-and-window
   :ni "M-w" #'other-window
   :ni "s-1" #'+workspace/switch-to-0
   :ni "s-2" #'+workspace/switch-to-1
   :ni "s-3" #'+workspace/switch-to-2
   :ni "s-4" #'+workspace/switch-to-3
   :ni "s-5" #'+workspace/switch-to-4
   :ni "s-6" #'+workspace/switch-to-5
   :ni "s-7" #'+workspace/switch-to-6
   :ni "s-8" #'+workspace/switch-to-7
   :ni "s-9" #'+workspace/switch-to-8))
