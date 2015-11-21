;;

(defun ice/apply-evil-initialization-order ()
  (use-package evil
    :ensure t
    :config
    (use-package evil-leader
      :ensure t
      :config
      (use-package evil-tabs
                   :ensure t
                   :config
                   (global-evil-leader-mode t)
                   (evil-mode 1)
                   (global-evil-tabs-mode t)))))

(defun ice/apply-general-evil-keymap ()
  (use-package evil
    :config
    (define-key evil-motion-state-map ";" 'evil-ex)
    (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
    (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
    (define-key evil-insert-state-map (kbd "C-k") nil)
    (evil-ex-define-cmd "q[uit]" 'delete-window))

  (use-package evil-leader
    :config
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
      "u" 'universal-argument
      "f" 'helm-find-files
      "b" 'helm-buffers-list
      "p" 'helm-browse-project
      "k" 'kill-buffer
      "r" 'helm-mini
      "d" 'dired
      "t" 'neotree
      "s" 'helm-occur)))

(defun ice/apply-evil-visuals ()
  (use-package evil
    :init
    (setq evil-emacs-state-cursor '("red" box))
    (setq evil-normal-state-cursor '("white" box))
    (setq evil-visual-state-cursor '("purple" box))
    (setq evil-insert-state-cursor '("white" bar))
    (setq evil-replace-state-cursor '("orange" box))
    (setq evil-operator-state-cursor '("orange" hollow))))

(defun ice/adjust-neotree-for-evil ()
  (use-package evil
    :config
    (use-package neotree
      :init
      (add-hook
       'neotree-mode-hook
       (lambda ()
	 (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-change-root)
	 (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	 (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
	 (define-key evil-normal-state-local-map (kbd "r") 'neotree-refresh)
	 (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle))))))

(provide 'ice-evil)
