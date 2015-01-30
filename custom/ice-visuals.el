(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-linum-mode 1)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(load-theme 'monokai t)

(blink-cursor-mode -1)

(fset 'yes-or-no-p 'y-or-n-p)

(provide 'ice-visuals)
