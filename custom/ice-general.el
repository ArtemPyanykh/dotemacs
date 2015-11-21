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
      :ensure t
      :config
      (exec-path-from-shell-initialize))
    (setq mac-option-modifier 'super)
    (setq mac-command-modifier 'meta)))


(provide 'ice-general)
