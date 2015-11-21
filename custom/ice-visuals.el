;;

(defun diminish-and-update-mode-line (mode title)
  (eval-after-load mode `(progn (diminish ',mode ,title) (force-mode-line-update))))

(defun ice/apply-visuals ()
  (require 'use-package)

  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (global-linum-mode 1)
  (blink-cursor-mode -1)
  (setq inhibit-startup-message t
	inhibit-startup-echo-area-message t)

  (use-package smartparens
    :ensure t
    :config
    (use-package smartparens-config))

  (use-package monokai-theme
    :ensure t
    :config
    (load-theme 'monokai t))

  (use-package neotree
    :config
    (custom-set-variables '(neo-theme 'nerd)))

  (use-package spaceline
    :ensure t
    :config
    (setq powerline-default-separator 'arrow)
    (use-package spaceline-config))

  (use-package diminish
    :ensure t
    :config
    (diminish-and-update-mode-line 'helm-mode " ℍ")
    (diminish-and-update-mode-line 'undo-tree-mode " UT"))

  (use-package rainbow-delimiters
    :ensure t
    :init
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

  (show-paren-mode))

(provide 'ice-visuals)
