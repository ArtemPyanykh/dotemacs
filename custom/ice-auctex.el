(defun ice/apply-tex ()
  (use-package tex-site
    :ensure auctex
    :init
    (progn
      (let ((displayline-viewer "displayline -b -g %n %o %b")) ;; %n/o/b are from TeX-expand-list variable

	(setq TeX-view-program-selection
	      `((output-pdf "displayline")
		(output-html "open")
		(output-dvi "open"))

	      TeX-view-program-list
	      `(("displayline" ,displayline-viewer))

	      TeX-auto-save t
	      TeX-parse-self t
	      TeX-PDF-mode t))

      (add-hook 'LaTeX-mode-hook (lambda ()
				   (latex-math-mode)
				   (visual-line-mode)
				   (tex-source-correlate-mode)))))

  (use-package auctex-latexmk
    :ensure t
    :init
    (progn
      (setq auctex-latexmk-inherit-TeX-PDF-mode t)
      (add-hook 'LaTeX-mode-hook 'auctex-latexmk-setup)))

  (use-package reftex
    :diminish reftex-mode " §"
    :init
    (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
    (setq reftex-plug-into-AUCTeX t)))

(defun ice/auctex-build-master ()
  (interactive)
  (let ((TeX-save-query nil))
    (when (TeX-save-document (TeX-master-file nil nil t))
      (TeX-command "LatexMk" 'TeX-master-file -1))))
      

(defun ice/apply-tex-leader-keymaps ()
  (evil-leader/set-key-for-mode 'latex-mode
    "mb" 'ice/auctex-build-master
    "mc" 'TeX-command-master
    "mv" 'TeX-view
    "mrl" 'reftex-toc
    "mrs" 'reftex-view-crossref
    "mpp" 'preview-at-point
    "mpe" 'preview-environment
    "mpr" 'preview-region
    "mpb" 'preview-buffer
    "mpd" 'preview-document
    "mpzp" 'preview-clearout-at-point
    "mpzr" 'preview-clearout
    "mpzb" 'preview-clearout-buffer
    "mpzd" 'preview-clearout-document
    "mfr" 'LaTeX-fill-region
    "mfp" 'LaTeX-fill-paragraph
    "mfs" 'LaTeX-fill-section
    "mfe" 'LaTeX-fill-environment))

(defun ice/apply-tex-completion ()
  (use-package company
    :init
    (add-hook 'LaTeX-mode-hook 'company-mode))

  (use-package company-auctex
    :ensure t
    :init
    (add-hook 'company-mode-hook 'company-auctex-init)))

(provide 'ice-auctex)
