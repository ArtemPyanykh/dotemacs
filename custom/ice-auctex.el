;; Auctex
(when (eq system-type 'darwin)
  (setq TeX-view-program-selection
        '((output-dvi "DVI Viewer")
          (output-pdf "PDF Viewer")
          (output-html "HTML Viewer")))

  (setq TeX-view-program-list
        '(("DVI Viewer" "open %o")
          ("PDF Viewer" "open %o")
          ("HTML Viewer" "open %o"))))

(setq TeX-auto-save t)
(setq TeX-parse-self t)

(setq TeX-PDF-mode t)

;;(setq TeX-newline-function (quote newline-and-indent))

(add-hook 'LaTeX-mode-hook (lambda()
                             (LaTeX-math-mode 1)))

(provide 'ice-auctex)
