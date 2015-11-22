(defun ice/apply-projectile ()
  (use-package projectile
    :ensure t
    :config (projectile-global-mode)))

(defun ice/apply-undo-tree ()
  (use-package undo-tree
    :diminish undo-tree-mode
    :init (global-undo-tree-mode)))

(defun ice/apply-neotree ()
  (use-package neotree
    :ensure t))

(defun ice/apply-nav ()
  (ice/apply-projectile)
  (ice/apply-undo-tree)
  (ice/apply-neotree))

(provide 'ice-nav)
