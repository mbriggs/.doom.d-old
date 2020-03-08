;;; ui/scaling/+dpi.el -*- lexical-binding: t; -*-

;; (defun mb--dpi ()
;;   (let* ((attrs (car (display-monitor-attributes-list)))
;;           (size (assoc 'mm-size attrs))
;;           (sizex (cadr size))
;;           (res (cdr (assoc 'geometry attrs)))
;;           (resx (- (caddr res) (car res))))
;;     (catch 'exit
;;                                         ; term
;;       (unless sizex
;;         (throw 'exit 10))
;;       (* (/ (float resx) sizex) 25.4))))

;; (defun mb--preferred-font-size ()
;;   (let ((dpi (mb--dpi)))
;;     (cond
;;       ((< dpi 110) 18.0)
;;       ((< dpi 160) 26.0)
;;       ((< dpi 330) 15.0)
;;       (t 15.0))))

;; (defun mb--preferred-big-font-scale ()
;;   (let* ((dpi (mb--dpi)))
;;   (cond
;;    ((< dpi 160) 1.8)
;;    ((< dpi 330) 1.4)
;;    (t 1.4))))

(defun mb-apply-doom-fonts ()
  (let* ((size 15.0) ;(mb--preferred-font-size))
         (big-scale 1.4) ; (mb--preferred-big-font-scale))
         (big-size (fround (* big-scale size))))
    (setq doom-font (font-spec :family "JetBrains Mono" :size size))
    (setq doom-big-font (font-spec :family "JetBrains Mono" :size big-size))))

(defun mb/refresh-fonts ()
  (interactive)
  (mb-apply-doom-fonts)
  (doom/reload-font))
