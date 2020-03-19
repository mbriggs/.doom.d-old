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
