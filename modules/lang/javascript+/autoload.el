;;; lang/javascript+/autoload.el -*- lexical-binding: t; -*-


(defconst *mjs-tsserver* (expand-file-name "~/code/typescript/built/local/tsserver.js"))

;;;###autoload
(defun mb/tide-mjs ()
  (interactive)
  (setq tide-tsserver-executable *mjs-tsserver*)
  (tide-restart-server))

;;;###autoload
(defun mb/tide-local ()
  (interactive)
  (setq tide-tsserver-executable nil)
  (tide-restart-server))
