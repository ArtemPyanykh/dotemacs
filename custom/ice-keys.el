;;

(defun ice-mode/navigate-elscreen (num)
  `(,(kbd (format "M-%d" num)) . (lambda () (interactive) (elscreen-goto ,num))))

(defun ice-mode/default-keymap ()
    (append

     `((,(kbd "M-h") . ns-do-hide-emacs)
       (,(kbd "M-C-f") . toggle-frame-fullscreen)
       (,(kbd "M-t") . elscreen-create)
       (,(kbd "M-w") . elscreen-kill)
       (,(kbd "M-}") . elscreen-next)
       (,(kbd "M-{") . elscreen-previous)
       (,(kbd "M-q") . save-buffers-kill-terminal))

     (mapcar 'ice-mode/navigate-elscreen '(0 1 2 3 4 5 6 7 8 9))))

(define-minor-mode ice-mode
  :init-value nil
  :lighter " ⅈ"
  :keymap (ice-mode/default-keymap))

(provide 'ice-keys)
