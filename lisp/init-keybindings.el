
;; ------------------------ init-keybindings.el ----------------------------

;; shortcut
(global-set-key (kbd "M-p") 'backward-sentence)
(global-set-key (kbd "M-n") 'forward-sentence)


;; make comments
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-/") 'toggle-comment-on-line)
(global-set-key (kbd "C-?") 'comment-or-uncomment-region)

;; get rid of suspension! press C-g-z to redo!
(global-set-key (kbd "C-z") 'undo)

;; duplicate a line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-c C-d") 'duplicate-line)

;; switch buffers
(global-set-key (kbd "C-}") 'switch-to-next-buffer)
(global-set-key (kbd "C-{") 'switch-to-prev-buffer)


;; ------------------------ EOF ----------------------------
(provide 'init-keybindings)

