(defun ice/apply-tex ()
  (use-package tex-site
    :ensure auctex
    :init
    (let ((displayline-viewer "displayline -b -g %n %o %b")) ;; %n/o/b are from TeX-expand-list variable

      (setq TeX-view-program-selection
	    `((output-pdf "displayline")
	      (output-html "open")
	      (output-dvi "open"))

	    TeX-view-program-list
	    `(("displayline" ,displayline-viewer))

	    TeX-auto-save t
	    TeX-parse-self t
	    TeX-PDF-mode t
	    reftex-plub-into-AUCTeX t))

    (add-hook 'LaTeX-mode-hook (lambda ()
				 (latex-math-mode)
				 (visual-line-mode)
				 (turn-on-reftex)
				 (tex-source-correlate-mode))))

  (use-package auctex-latexmk
    :ensure t
    :config
    (auctex-latexmk-setup)
    (setq auctex-latexmk-inherit-TeX-PDF-mode t)))

(provide 'ice-auctex)
