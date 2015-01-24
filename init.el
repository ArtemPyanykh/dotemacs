(require 'cl)
(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(defvar packages
  '(monokai-theme
    exec-path-from-shell
    flx-ido
    evil
    smartparens
    yasnippet
    auctex
    auto-complete
    auto-complete-auctex)
  "A list of packages I want automatically installed with package.el")

(defun all-packages-installed-p ()
  (loop for p in packages
  when (not (package-installed-p p)) do (return nil)
  finally (return t)))

(unless (all-packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (message "%s" "Done!")
  (dolist (p packages)
    (when (not (package-installed-p p))
      (package-install p))))

(add-to-list 'load-path "~/.emacs.d/custom/")

(require 'ice-osx)
(require 'ice-general)
(require 'ice-visuals)
(require 'ice-evil)
(require 'ice-auctex)
(require 'ice-keys)
(require 'ice-autocomplete)
;;(require 'ice-editor)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4e262566c3d57706c70e403d440146a5440de056dfaeb3062f004da1711d83fc" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
