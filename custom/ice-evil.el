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
  "d" 'dired
  "t" 'neotree)

; Use C-u to scroll up, SPC-u for universal argument
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(key-chord-define evil-insert-state-map "fd" 'evil-normal-state)
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


(defvar emacs-configuration-directory
  "~/.emacs.d/"
  "The directory where the emacs configuration files are stored.")
(defvar elscreen-tab-configuration-store-filename
  (concat emacs-configuration-directory ".elscreen")
  "The file where the elscreen tab configuration is stored.")

(defun elscreen-store ()
  "Store the elscreen tab configuration."
  (interactive)
  (if (desktop-save emacs-configuration-directory)
      (with-temp-file elscreen-tab-configuration-store-filename
	(insert (prin1-to-string (elscreen-get-screen-to-name-alist))))))

(defun elscreen-restore ()
  "Restore the elscreen tab configuration."
  (interactive)
  (if (desktop-read)
      (let ((screens (reverse
		      (read
		       (with-temp-buffer
			 (insert-file-contents elscreen-tab-configuration-store-filename)
			 (buffer-string))))))
	(while screens
	  (setq screen (car (car screens)))
	  (setq buffers (split-string (cdr (car screens)) ":"))
	  (if (eq screen 0)
	      (switch-to-buffer (car buffers))
	    (elscreen-find-and-goto-by-buffer (car buffers) t t))
	  (while (cdr buffers)
	    (switch-to-buffer-other-window (car (cdr buffers)))
	    (setq buffers (cdr buffers)))
	  (setq screens (cdr screens))))))

(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "r") 'neotree-refresh)
	    (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)))

(provide 'ice-evil)
