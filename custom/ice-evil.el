;; Evil mode!

;; evil leader has to be enabled before evil mode
(require 'evil-leader)
(global-evil-leader-mode t)
(evil-leader/set-leader "<SPC>")

(require 'evil)
(evil-mode 1)

(require 'evil-tabs)
(global-evil-tabs-mode t)

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("white" box))
(setq evil-visual-state-cursor '("gray" box))
(setq evil-insert-state-cursor '("white" bar))
(setq evil-replace-state-cursor '("white" box))
(setq evil-operator-state-cursor '("white" hollow))

(require 'powerline)
(powerline-evil-vim-color-theme)
(display-time-mode t)


(provide 'ice-evil)
