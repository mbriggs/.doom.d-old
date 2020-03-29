;;; tools/+lsp/config.el -*- lexical-binding: t; -*-

(after! lsp-mode
  (lsp-register-client
    (make-lsp-client :new-connection (lsp-stdio-connection
                                       (lambda () lsp-clients-angular-language-server-command))
      :activation-fn (lambda (&rest _args)
                       (and (string-match-p ".*\.html$" (buffer-file-name))
                         (file-exists-p (f-join (projectile-project-root) "angular.json"))))
      :priority -1
      :notification-handlers (ht ("angular-language-service/projectLoadingStart" #'lsp-client--angular-start-loading)
                               ("angular-language-service/projectLoadingFinish" #'lsp-client--angular-finished-loading))
      :add-on? t
      :server-id 'angular-ls)))

(setq
  lsp-ui-sideline-show-diagnostics nil
  lsp-ui-sideline-show-hover nil
  lsp-ui-sideline-show-code-actions nil)

(map!
  (:map lsp-ui-mode-map
    :localleader
    (:prefix ("K" . "peek")
      "r" #'lsp-ui-peek-find-references
      "d" #'lsp-ui-peek-find-definitions
      "i" #'lsp-ui-peek-find-implementation)))
