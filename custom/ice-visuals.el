(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-linum-mode 1)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(load-theme 'solarized-dark t)

(blink-cursor-mode -1)

(fset 'yes-or-no-p 'y-or-n-p)

(require 'diminish)
(eval-after-load "filladapt" '(diminish 'filladapt-mode))

(provide 'ice-visuals)
