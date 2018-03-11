
;; ------------------------ init-keybindings.el ----------------------------

;; make comments
(global-set-key (kbd "C-/") 'toggle-comment-on-line)
(global-set-key (kbd "C-?") 'comment-or-uncomment-region)

;; get rid of suspension! press C-g-z to redo!
(global-set-key (kbd "C-z") 'undo)

;; go back to previous buffer
(global-set-key (kbd "C-x x") 'switch-to-prev-buffer)

;;  current window (= C-x 0)
(global-set-key (kbd "C-x z") 'delete-window)

;; duplicate a line
(global-set-key (kbd "C-c C-d") 'duplicate-line)

;; switch buffer
(global-set-key (kbd "M-}") 'c-switch-to-next-buffer)
(global-set-key (kbd "M-{") 'c-switch-to-prev-buffer)

;; ido-mode
(defun bind-ido-keys ()
  "Keybindings for ido mode."
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match) 
  (define-key ido-completion-map (kbd "C-p")   'ido-prev-match))
(add-hook 'ido-setup-hook #'bind-ido-keys)

;; ace-jump-mode
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; indent-region
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; move 5 lines
(global-set-key (kbd "M-p") 'junhao-prev-lines)
(global-set-key (kbd "M-n") 'junhao-next-lines)

;; 搜索当前区域
(global-set-key (kbd "M-s o") 'occur-dwim)



;; ------------------------ EOF ----------------------------
(provide 'init-keybindings)

