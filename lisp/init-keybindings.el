
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
; skip abnormal buffers
(defun f-normal-buffer ()
  (or (not buffer-read-only)
      (buffer-file-name)))
(defun c-switch-to-next-buffer ()
  (interactive)
  (unless (minibufferp)
    (let ((p t) (bn (buffer-name)))
      (switch-to-next-buffer)
      (while (and p (not (f-normal-buffer)))
	(switch-to-next-buffer)
	(when (string= bn (buffer-name)) (setq p nil))))))
(defun c-switch-to-prev-buffer ()
  (interactive)
  (unless (minibufferp)
    (let ((p t) (bn (buffer-name)))
      (switch-to-prev-buffer)
      (while (and p (not (f-normal-buffer)))
	(switch-to-prev-buffer)
	(when (string= bn (buffer-name)) (setq p nil))))))
; keybindings
(global-set-key (kbd "C-}") 'c-switch-to-next-buffer)
(global-set-key (kbd "C-{") 'c-switch-to-prev-buffer)

;; ------------------------ EOF ----------------------------
(provide 'init-keybindings)

