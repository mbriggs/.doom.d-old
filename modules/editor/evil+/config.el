;;; ui/editing/config.el -*- lexical-binding: t; -*-

(map!
  :n "L" #'mb/end-of-line
  :n "H" #'mb/start-of-line

  :ni "M-w" #'other-window

  :n "RET" #'mb/evil-n-ret
  :n "<down>" #'ivy-occur-next-error

  ;; insert

  :i "M-<left>" #'mb/start-of-line
  :i "M-<right>" #'mb/end-of-line

  :i "M-<backspace>" #'mb/delete-whole-line
  :i "S-<return>" #'mb/open-line-above
  :i "M-/" #'mb/comment-or-uncomment-region-or-line

  :i "M-D" #'mb/duplicate-line-or-region

  :i "M-d" #'mc/mark-next-like-this-word

  :i "M-k" #'sp-kill-sexp
  :i "M-K" #'sp-splice-sexp
  :i "A-L" #'sp-backward-barf-sexp
  :i "A-H" #'sp-backward-slurp-sexp
  :i "A-h" #'sp-forward-barf-sexp
  :i "A-l" #'sp-forward-slurp-sexp

  :leader

  :desc "Previous Buffer" "/" #'mb/switch-to-previous-buffer)

(defun mb/evil-n-ret ()
  (interactive)
  (evil-ex-nohighlight)
  (save-buffer)
  (+workspace/display))

(advice-add '+workspace:switch-next :after #'+workspace/display)
(advice-add '+workspace:switch-previous :after #'+workspace/display)

(define-key key-translation-map (kbd "ESC") (kbd "C-g"))
