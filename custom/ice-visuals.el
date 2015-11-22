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
    :ensure t)

  (use-package rainbow-delimiters
    :ensure t
    :init
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

  (show-paren-mode)

  (use-package helm
    :commands helm-autoresize-mode
    :init
    (setq helm-display-header-line nil
          helm-autoresize-max-height 30
          helm-autoresize-min-height 30)
    (helm-autoresize-mode 1)))

(provide 'ice-visuals)
