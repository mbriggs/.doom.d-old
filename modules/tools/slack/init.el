;;; tools/slack/init.el -*- lexical-binding: t; -*-

(setq slack-completing-read-function #'ivy-completing-read)
(setq slack-buffer-emojify nil)
(setq slack-prefer-current-team t)

; alert

(if IS-MAC
  (setq alert-default-style 'notifier)
  (setq alert-default-style 'libnotify))

(setq alert-default-style (quote notifier))
(setq alert-user-configuration (quote ((nil notifier nil))))

(setq
 lui-time-stamp-position 'right-margin
 lui-fill-type nil)
(add-hook 'lui-mode-hook 'mb/lui-setup)
