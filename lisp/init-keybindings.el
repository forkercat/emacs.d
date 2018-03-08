
;; ------------------------ init-keybindings.el ----------------------------

;; shortcut
(global-set-key (kbd "M-p") 'backward-sentence)
(global-set-key (kbd "M-n") 'forward-sentence)

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; C-h w to see the shortcut of the key   or + f

;; make comments
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-/") 'toggle-comment-on-line)
(global-set-key (kbd "C-?") 'comment-or-uncomment-region)

;; get rid of suspension! press C-g-z to redo!
(global-set-key (kbd "C-z") 'undo)

;; multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)  ;; don't know how to use
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-a") 'mc/mark-all-like-this)

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


;; ------------------------ EOF ----------------------------
(provide 'init-keybindings)

