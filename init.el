(require 'cl)
(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(defvar packages
  '(monokai-theme
    solarized-theme
    exec-path-from-shell
    flx-ido
    key-chord
    evil
    evil-leader
    evil-tabs
    powerline-evil
    smartparens
    yasnippet
    auctex
    auctex-latexmk
    company
    projectile)
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
(require 'ice-projectile)
(require 'ice-keys)
(require 'ice-autocomplete)

