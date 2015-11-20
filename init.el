(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'load-path "~/.emacs.d/custom/")

(package-initialize)
(package-refresh-contents)

(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

(require 'ice-general)
(require 'ice-helm)
(require 'ice-evil)

(ice/apply-sensible-defaults)
(ice/apply-mac-defaults)
(ice/apply-visuals)
(ice/apply-helm-setup)
(ice/apply-projectile)
(ice/apply-undo-tree)
(ice/apply-evil-initialization-order)
(ice/apply-evil-visuals)
(ice/apply-general-evil-keymap)
(ice/adjust-neotree-for-evil)

(require 'ice-auctex)

(toggle-frame-maximized)
;;(require 'ice-autocomplete)
;;(require 'ice-spelling)

;; (spaceline-emacs-theme)

;; (defvar packages
;;   '(
;;     evil-nerd-commenter
;;     yasnippet
;;     auctex
;;     auctex-latexmk
;;     auto-complete
;;     projectile
;;     diminish
;;     yaml-mode
;;   "A list of packages I want automatically installed with package.el")

;; (defun all-packages-installed-p ()
;;   (loop for p in packages
;;   when (not (package-installed-p p)) do (return nil)
;;   finally (return t)))

;; (add-to-list 'load-path "~/.emacs.d/custom/")

;; (unless (all-packages-installed-p)
;;   (message "%s" "Refreshing package database...")
;;   (package-refresh-contents)
;;   (message "%s" "Done!")
;;   (dolist (p packages)
;;     (when (not (package-installed-p p))
;;       (package-install p))))
