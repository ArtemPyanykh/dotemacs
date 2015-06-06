;; Evil mode!

;; evil leader has to be enabled before evil mode
(require 'evil-leader)
(global-evil-leader-mode t)

(define-key evil-motion-state-map ";" 'evil-ex)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "u" 'universal-argument
  "f" 'ido-find-file
  "b" 'ido-switch-buffer
  "B" 'ibuffer
  "k" 'kill-buffer
  "r" 'ido-recentf-open
  "d" 'dired)

; Use C-u to scroll up, SPC-u for universal argument
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))

;; regular evil-mode stuff
(require 'evil)
(evil-mode 1)

;; evil-tabs section
(require 'evil-tabs)
(global-evil-tabs-mode t)

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("white" box))
(setq evil-visual-state-cursor '("gray" box))
(setq evil-insert-state-cursor '("white" bar))
(setq evil-replace-state-cursor '("white" box))
(setq evil-operator-state-cursor '("white" hollow))

;; setup evil-escape
(setq-default evil-escape-key-sequence "jk")
(global-hl-line-mode 1)
(require 'evil-escape)
(evil-escape-mode)

(provide 'ice-evil)
