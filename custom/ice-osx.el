;; We need this to fix PATH when emacs is starged from GUI
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; OS X Keybindings
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char)
  (global-set-key (kbd "M-w") 'ns-do-hide-emacs)
  (global-set-key (kbd "M-h") 'ns-do-hide-emacs))

;; GC on 20M
(setq gc-cons-threshold 20000000)

(provide 'ice-osx)
