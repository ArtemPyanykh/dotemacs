;; Evil mode!

;; evil leader has to be enabled before evil mode
(require 'evil-leader)
(global-evil-leader-mode t)
(evil-leader/set-leader "<SPC>")

; Use C-u to scroll up, SPC-u for universal argument
(evil-leader/set-key "u" 'universal-argument)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))

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
