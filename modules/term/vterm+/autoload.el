;;; term/vterm+/autoload.el -*- lexical-binding: t; -*-

;;;###autoload
(defun mb/remember-point ()
  (setq-local mb-insert-point (point)))

;;;###autoload
(defun mb/maybe-goto-point ()
  (when mb-insert-point
    (goto-char mb-insert-point)
    (setq-local mb-insert-point nil)))
