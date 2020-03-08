;;; tools/testing/autoload.el -*- lexical-binding: t; -*-

(defconst mb--test-bench-ts-re "^test/\\(automated\\|interactive\\)/.*\\.ts$")

(defvar mb--last-test nil)

;;;###autoload
(defun mb/test-bench-ts ()
  (interactive)
  (let ((file (file-relative-name buffer-file-name (projectile-project-root))))
    (when (string-match-p mb--test-bench-ts-re file)
      (mb--run-test buffer-file-name))))

;;;###autoload
(defun mb/run-last-test ()
  (interactive)
  (when mb--last-test
    (mb--run-test mb--last-test)))

;;;###autoload
(defun mb--run-test (file-name)
  (setq mb--last-test file-name)
  (compile (concat "ts-node " file-name)))
