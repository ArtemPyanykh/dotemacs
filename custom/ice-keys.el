;; General keybindings not specific to some mode
(require 'key-chord)
(key-chord-mode 1)

;; Keys for evil mode
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(define-key evil-motion-state-map ";" 'evil-ex)

(evil-leader/set-key
  "f" 'ido-find-file
  "b" 'ido-switch-buffer
  "B" 'ibuffer
  "k" 'kill-buffer
  "r" 'ido-recentf-open
  "d" 'dired)


(global-set-key (kbd "<C-return>") 'toggle-frame-maximized)
(global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)

(define-key global-map (kbd "RET") 'newline-and-indent)

(provide 'ice-keys)
