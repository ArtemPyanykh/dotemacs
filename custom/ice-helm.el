(require 'helm-config)
(require 'helm-projectile)

(setq helm-mode-fuzzy-match t
      helm-completion-in-region-fuzzy-match t)

(helm-mode 1)
(helm-projectile-on)

(provide 'ice-helm)
