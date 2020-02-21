;;; tools/gist/config.el -*- lexical-binding: t; -*-

(after! yagist
  (load-library (expand-file-name "+gist-token.el.gpg" (dir!)))
  (setq yagist-github-token *gist-token*))
