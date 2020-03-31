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
                    :server-id 'angular-ls))

  (defun lsp--on-diagnostics (workspace params)
    "Callback for textDocument/publishDiagnostics.
interface PublishDiagnosticsParams {
    uri: string;
    diagnostics: Diagnostic[];
}
PARAMS contains the diagnostics data.
WORKSPACE is the workspace that contains the diagnostics."
    (let* ((file (lsp--uri-to-path (gethash "uri" params)))
           (diagnostics (seq-map #'lsp--make-diag (gethash "diagnostics" params)))
           (buffer (lsp--buffer-for-file file))
           (workspace-diagnostics (lsp--workspace-diagnostics workspace))
           (server (lsp--client-server-id (lsp--workspace-client workspace)))
           (filter (lambda (d)
                     (and (eq server 'ts-ls)
                          (< (lsp-diagnostic-severity d) 3)))))

      (if (seq-empty-p diagnostics)
          (remhash file workspace-diagnostics)
        (when (or lsp-report-if-no-buffer buffer)
          (puthash file (-filter filter diagnostics) workspace-diagnostics)))

      (run-hooks 'lsp-diagnostics-updated-hook)

      (when buffer
        (save-mark-and-excursion
          (with-current-buffer buffer
            (run-hooks 'lsp-after-diagnostics-hook)))))))



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
