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
(require 'ice-keys)
(require 'ice-nav)
(require 'ice-visuals)
(require 'ice-helm)
(require 'ice-evil)
(require 'ice-auctex)
(require 'ice-completion)

(ice/apply-sensible-defaults)
(ice/apply-mac-defaults)
(ice/apply-sensible-editor-defaults)

(ice/apply-nav)

(ice/apply-visuals)

(ice/apply-helm-setup)

(ice/apply-evil-initialization-order)
(ice/apply-evil-visuals)
(ice/apply-general-evil-keymap)
(ice/apply-evil-russian-keymap)
(ice/adjust-neotree-for-evil)

(ice/apply-completion)

(ice/apply-tex)
(ice/apply-tex-leader-keymaps)
(ice/apply-tex-russian-leader-keymaps)
(ice/apply-tex-completion)

(use-package yaml-mode
  :ensure t)

(use-package ace-jump-mode
  :ensure t)

(setq-default ice-mode t)
(toggle-frame-maximized)

;;(require 'ice-spelling)
