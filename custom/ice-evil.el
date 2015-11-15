;; Evil mode!

;; evil leader has to be enabled before evil mode
(require 'evil-leader)
(global-evil-leader-mode t)

(define-key evil-motion-state-map ";" 'evil-ex)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "u" 'universal-argument
  "f" 'helm-find-files
  "b" 'helm-list-buffers
  "p" 'helm-browse-project
  "k" 'kill-buffer
  "r" 'helm-mini
  "d" 'dired
  "t" 'neotree
  "s" 'helm-occur)

; Use C-u to scroll up, SPC-u for universal argument
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)
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

(evilnc-default-hotkeys)

(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-change-root)
	    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "r") 'neotree-refresh)
	    (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)))

;; seamless interop with Ru keyboard layout

(provide 'ice-evil)
