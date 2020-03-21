;;; tools/mongo/autoload.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +inf-mongo ()
  (interactive)
  (+inf-mongo--load-servers)
  (let* ((name (ivy-completing-read "server: " (mapcar 'car +mongo/servers)))
          (server (cdr (assoc name +mongo/servers))))
    (inf-mongo (concat "/usr/bin/mongo " server))
    (rename-buffer (concat "*mongo-" name "*"))))

;;;###autoload
(defun +inf-mongo--load-servers ()
  (load-library (expand-file-name "~/.mongo.el.gpg")))
