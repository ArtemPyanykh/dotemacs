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
    powerline
    powerline-evil
    smartparens
    yasnippet
    auctex
    auctex-latexmk
    auto-complete
    projectile
    diminish
    smex
    scala-mode2
    ensime
    sbt-mode)
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
(require 'ice-evil)
(require 'ice-auctex)
(require 'ice-autocomplete)
(require 'ice-spelling)
(require 'ice-scala)
