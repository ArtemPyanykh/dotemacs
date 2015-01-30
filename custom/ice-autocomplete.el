;(require 'auto-complete-config)
;(require 'auto-complete-auctex)

;(ac-config-default)

(require 'company)

(setq company-idle-delay 0.2)
(setq company-tooltip-limit 10)
(setq company-minimum-prefix-length 2)

(global-company-mode 1)

; (require 'company-auctex)
; (company-auctex-init)

(require 'yasnippet)
(yas-global-mode)

(provide 'ice-autocomplete)

