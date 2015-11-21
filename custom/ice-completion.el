(defun ice/apply-completion-keys ()
  (define-key company-mode-map (kbd "C-j") 'company-select-next)
  (define-key company-mode-map (kbd "C-k") 'company-select-previous))

(defun ice/apply-completion ()
  (use-package company
    :diminish " 𝒜"
    :ensure t
    :init
    (progn
      (add-hook 'prog-mode-hook 'company-mode)
      (setq company-idle-delay 0.2))

    :config
    (ice/apply-completion-keys)))

(provide 'ice-completion)
