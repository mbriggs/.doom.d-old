;;; tools/slack/config.el -*- lexical-binding: t; -*-

(after! slack
  (add-hook 'slack-mode-hook #'doom-mark-buffer-as-real-h)
  (add-hook 'slack-mode-hook #'evil-insert-state)
  (add-hook 'slack-mode-hook
    (lambda ()
      (add-hook 'evil-insert-state-entry-hook 'evil-forward-section-begin nil t)))

  (slack-register-team
    :name "NRWL"
    :token (auth-source-pick-first-password
             :host "nrwl.slack.com"
             :user "matt@nrwl.io")
    :subscribed-channels '((nrwl_capital_one_ease nrwl_general nrwl_toronto_team
                             nrwl_dev nrwl_product_nx_cloud nrwl_team_capital_one)))

  (slack-register-team
    :name "Eventide"
    :token (auth-source-pick-first-password
             :host "eventide-project.slack.com"
             :user "matt@mattbriggs.net")
    :subscribed-channels '((general software-development tangent))))


(set-popup-rule! "^*Slack.*" :modeline t :side 'right :size 0.3 :select t :quit nil)
(set-popup-rule! "^*Slack.*\\(Thread\\)" :modeline t :side 'left :size 0.3 :select t :quit nil)
(set-popup-rule! "^*Slack.*\\(Compose\\|Edit\\) Message" :modeline t :side 'top :size 0.4 :select t :quit nil)

(map!
  (:map slack-info-mode-map
    :localleader
    :desc "Update room messages" "g" #'slack-room-update-messages)

  (:map slack-mode-map
    :n "q" #'kill-buffer-and-window
    :n "RET" #'slack-message-write-another-buffer
    :ni "C-n" #'slack-buffer-goto-next-message
    :ni "C-p" #'slack-buffer-goto-prev-message
    :i "C-u" #'slack-message-embed-mention
    :i "C-t" #'slack-thread-show-or-create
    :i "C-c" #'slack-message-embed-channel
    :i "C-r" #'slack-message-add-reaction
    :i "C-d" #'slack-message-delete
    :i "C-e" #'slack-message-edit
    :i "C-j" #'other-window

    :localleader
    "k" #'slack-buffer-kill
    "f" #'slack-file-upload
    "p" #'slack-room-pins-list
    "r" #'slack-message-pins-remove
    "a" #'slack-message-pins-add
    "r" #'slack-message-remove-reaction
    "s" #'slack-message-show-reaction-users)

  (:map slack-edit-message-mode-map
    :i "C-u" #'slack-message-embed-mention
    :i "C-c" #'slack-message-embed-channel
    :n "q" #'slack-message-cancel-edit
    :n "RET" #'slack-message-send-from-buffer)

  (:leader
    (:prefix ("k" . "slack")
      :desc "Start slack" "s" #'slack-start
      :desc "Change team" "t" #'slack-change-current-team
      :desc "Select" "k" #'slack-select-rooms
      :desc "Select unread" "u" #'slack-select-unread-rooms
      :desc "Select group" "g" #'slack-group-select
      :desc "Select IM" "i" #'slack-im-select
      :desc "Select channel" "c" #'slack-channel-select
      (:prefix ("d" . "update")
        :desc "Groups" "g" #'slack-group-list-update
        :desc "Channels" "c" #'slack-channel-list-update
        :desc "IMs" "i" #'slack-im-list-update))))
