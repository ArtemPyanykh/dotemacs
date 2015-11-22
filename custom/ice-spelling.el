(require 'flyspell)
(require 'ispell)

(setq
 ispell-program-name "aspell"
 ispell-extra-args '("--sug-mode=ultra"))

(setq flyspell-issue-welcome-flag nil)
(setq flyspell-delay 1)
(setq ispell-highlight-face (quote flyspell-incorrect))
(setq ispell-have-new-look t)
(setq ispell-enable-tex-parser t)
                                        ;(setq flyspell-always-use-popup t)

(provide 'ice-spelling)
