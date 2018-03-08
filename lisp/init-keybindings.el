
;; ------------------------ init-keybindings.el ----------------------------

;; shortcut
(global-set-key (kbd "M-p") 'backward-sentence)
(global-set-key (kbd "M-n") 'forward-sentence)

;; smex keybindings
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; C-h w to see the shortcut of the key   or + f



;; ------------------------ EOF ----------------------------
(provide 'init-keybindings)
