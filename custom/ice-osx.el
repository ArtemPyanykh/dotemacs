;; We need this to fix PATH when emacs is starged from GUI
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; OS X Keybindings
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char))

;; GC on 20M
(setq gc-cons-threshold 20000000)

(provide 'ice-osx)
