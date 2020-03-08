;;; ui/scaling/+dpi.el -*- lexical-binding: t; -*-

(defun mb--dpi ()
  (let* ((attrs (car (display-monitor-attributes-list)))
          (size (assoc 'mm-size attrs))
          (sizex (cadr size))
          (res (cdr (assoc 'geometry attrs)))
          (resx (- (caddr res) (car res))))
    (catch 'exit
                                        ; term
      (unless sizex
        (throw 'exit 10))
      (* (/ (float resx) sizex) 25.4))))

(defun mb--preferred-font-size ()
  (let ((dpi (mb--dpi)))
    (cond
     ((< dpi 110) 18.0) ; macbook on lg monitor
     ((< dpi 160) 10.0) ; linux on lg monitor
     ((< dpi 330) 13.0) ; linux xps laptop
     (t 13.0))))

(defconst mb--big-scale 1.4)

(defun mb-apply-doom-fonts ()
  (let* ((size (mb--preferred-font-size))
         (big-size (fround (* mb--big-scale size))))
    (setq doom-font (font-spec :family "JetBrains Mono" :size size))
    (setq doom-big-font (font-spec :family "JetBrains Mono" :size big-size))))

(defun mb/refresh-fonts ()
  (interactive)
  (mb-apply-doom-fonts)
  (doom/reload-font))
