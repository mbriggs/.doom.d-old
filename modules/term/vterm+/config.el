;;; term/vterm+/config.el -*- lexical-binding: t; -*-

(after! vterm
  (setq mb-insert-point nil)
  (add-hook 'vterm-mode-hook
    (lambda ()
      (add-hook 'evil-insert-state-exit-hook 'mb/remember-point nil t)
      (add-hook 'evil-insert-state-entry-hook 'mb/maybe-goto-point nil t))))
