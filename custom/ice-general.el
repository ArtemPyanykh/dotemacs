;;;;

(defun ice/apply-sensible-defaults ()
  ;; GC on 20M
  (setq gc-cons-threshold 20000000)
  ;; Newline at end of file
  (setq require-final-newline t)
  ;; Store all backup and autosave files in the tmp dir
  (setq backup-directory-alist
	`((".*" . , temporary-file-directory)))
  (setq auto-save-file-name-transforms
	`((".*" , temporary-file-directory t)))
  ;; Autosave the undo-tree history
  (setq undo-tree-history-directory-alist
	`((".*" . , temporary-file-directory)))
  (setq undo-tree-auto-save-history t)
  ;; Revert buffers automatically when underlying files are changed externally
  (global-auto-revert-mode t)
  ;; No confirmation for new buffers
  (setq confirm-nonexistent-file-or-buffer nil)
  ;; Disable alarm bell
  (setq ring-bell-function 'ignore)
  ;; Ease the yes-no question answering
  (fset 'yes-or-no-p 'y-or-n-p)
  ;; Enable dired find alternate file
  (put 'dired-find-alternate-file 'disabled nil))

(defun ice/apply-mac-defaults ()
  (when (eq system-type 'darwin)
    (require 'use-package)
    (use-package exec-path-from-shell
      :config
      (exec-path-from-shell-initialize))
    (setq mac-option-modifier 'super)
    (setq mac-command-modifier 'meta)))

(defun ice-mode/navigate-elscreen (num)
  `((kbd ,(format "M-%d" num)) . (lambda () (interactive) (elscreen-goto ,num))))

(defun ice-mode/default-keymap ()
    (append

     `((,(kbd "M-h") . ns-do-hide-emacs)
       (,(kbd "M-C-f") . toggle-frame-fullscreen)
       (,(kbd "M-t") . elscreen-create)
       (,(kbd "M-w") . elscreen-kill)
       (,(kbd "M-}") . elscreen-next)
       (,(kbd "M-{") . elscreen-previous)
       (,(kbd "M-q") . save-buffers-kill-terminal)
       (,(kbd "RET") . newline-and-indent))

     (mapcar 'ice-mode/navigate-elscreen '(0 1 2 3 4 5 6 7 8 9))))

(define-minor-mode ice-mode
  :init-value t
  :lighter " ⅈ"
  :keymap (ice-mode/default-keymap))

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
    :ensure t
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
    (diminish-and-update-mode-line 'helm-mode " ℍ"))
    (diminish-and-update-mode-line 'undo-tree-mode " UT"))

;; Projectile
(defun ice/apply-projectile ()
  (use-package projectile
    :ensure t
    :config (projectile-global-mode)))

(defun ice/apply-undo-tree ()
  (use-package undo-tree
    :diminish undo-tree-mode
    :init (global-undo-tree-mode)))

(provide 'ice-general)
