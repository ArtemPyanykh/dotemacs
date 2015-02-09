;; Auctex
(when (eq system-type 'darwin)
  (setq TeX-view-program-selection
        '((output-dvi "DVI Viewer")
          (output-pdf "PDF Viewer")
          (output-html "HTML Viewer")))

  (setq TeX-view-program-list
        '(("DVI Viewer" "open %o")
          ("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")
          ("HTML Viewer" "open %o"))))

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-PDF-mode t)
(setq reftex-plug-into-AUCTeX t)

(add-hook 'LaTeX-mode-hook (lambda()
                             (LaTeX-math-mode 1)
			     (visual-line-mode t)
			     (turn-on-reftex)))

(require 'auctex-latexmk)
(auctex-latexmk-setup)

(provide 'ice-auctex)
