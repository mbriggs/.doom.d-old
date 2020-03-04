;;; tools/testing/autoload.el -*- lexical-binding: t; -*-

(defconst mb--test-bench-ts-re "^test/\\(automated\\|interactive\\)/.*\\.ts$")

;;;###autoload
(defun mb/test-bench-ts ()
  (interactive)
  (let ((file (file-relative-name buffer-file-name (projectile-project-root))))
    (when (string-match-p mb--test-bench-ts-re file)
      (compile (concat "ts-node " buffer-file-name)))))
