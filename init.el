(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(defvar packages
  '(monokai-theme
    exec-path-from-shell
    flx-ido
    key-chord
    evil
    evil-leader
    evil-tabs
    evil-nerd-commenter
    neotree
    smartparens
    yasnippet
    auctex
    auctex-latexmk
    auto-complete
    projectile
    diminish
    yaml-mode
    helm
    helm-ag
    helm-ls-git
    helm-projectile
    powerline
    powerline-evil
    spaceline)
  "A list of packages I want automatically installed with package.el")

(defun all-packages-installed-p ()
  (loop for p in packages
  when (not (package-installed-p p)) do (return nil)
  finally (return t)))

(add-to-list 'load-path "~/.emacs.d/custom/")

(unless (all-packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (message "%s" "Done!")
  (dolist (p packages)
    (when (not (package-installed-p p))
      (package-install p))))

(require 'ice-general)
(require 'ice-helm)
(require 'ice-evil)
(require 'ice-auctex)
(require 'ice-autocomplete)
(require 'ice-spelling)

(spaceline-emacs-theme)
