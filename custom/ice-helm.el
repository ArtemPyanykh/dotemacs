(defun ice/apply-helm-setup ()
  (use-package helm
    :ensure t
    :diminish " ℍ"
    :config
    (use-package helm-config)
    (setq helm-mode-fuzzy-match t
          helm-completion-in-region-fuzzy-match t)
    (helm-mode 1))

  (use-package helm-ag :ensure t)

  (use-package helm-ls-git :ensure t)

  (use-package helm-projectile
    :ensure t
    :config
    (use-package projectile)
    (helm-projectile-on)))

(provide 'ice-helm)
