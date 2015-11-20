;; Auctex
;; (when (eq system-type 'darwin)
;;   (setq TeX-view-program-selection
;;         '((output-dvi "DVI Viewer")
;;           (output-pdf "PDF Viewer")
;;           (output-html "HTML Viewer")))

;;   (setq TeX-view-program-list
;;         '(("DVI Viewer" "open %o")
;;           ("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")
;;           ("HTML Viewer" "open %o"))))

;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq TeX-PDF-mode t)
;; (setq reftex-plug-into-AUCTeX t)

;; (add-hook 'LaTeX-mode-hook
;; 	  (lambda ()
;; 	    (latex-math-mode)
;; 	    (visual-line-mode)
;; 	    (turn-on-reftex)))

(use-package tex-site
  :ensure auctex)

(use-package auctex-latexmk
  :ensure t
  :config (auctex-latexmk-setup))

(provide 'ice-auctex)
