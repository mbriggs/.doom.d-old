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
      ((< dpi 110) 18)
      ((< dpi 160) 26)
      ((< dpi 330) 54)
      (t 54))))

(defun mb--preferred-big-font-scale ()
  (let*
    ((dpi (mb--dpi))
      (scale (cond
               ((< dpi 160) 0.8)
               ((< dpi 330) 0.4)
               (t 0.4))))
    (if IS-MAC (+ scale 1)
      scale)))

(defun mb-apply-doom-fonts ()
  (let ((size (mb--preferred-font-size))
         (big-scale (mb--preferred-big-font-scale)))
    (setq doom-font (font-spec :family "JetBrains Mono" :size size))
    (setq doom-big-font (font-spec :family "JetBrains Mono" :size (* big-scale size)))))

(defun mb/refresh-fonts ()
  (interactive)
  (mb-apply-doom-fonts)
  (doom/reload-font))
