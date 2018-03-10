
;; ------------------------ init-keybindings.el ----------------------------

;; make comments
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-/") 'toggle-comment-on-line)
(global-set-key (kbd "C-?") 'comment-or-uncomment-region)

;; get rid of suspension! press C-g-z to redo!
(global-set-key (kbd "C-z") 'undo)

;; go back to previous buffer
(global-set-key (kbd "C-x x") 'switch-to-prev-buffer)



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
                                        ;q; skip abnormal buffers
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
;; keybindings
(global-set-key (kbd "s-}") 'c-switch-to-next-buffer)
(global-set-key (kbd "s-{") 'c-switch-to-prev-buffer)


;; indent-region
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
          (indent-region (region-beginning) (region-end))
	  (message "Indent selected region :)"))
      (progn
	(indent-buffer)
        (message "Indent buffer :)")))))
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)


;; move 5 lines
(defun junhao-prev-lines ()
  (interactive)
  (cl-loop repeat 5 do (previous-line)))

(defun junhao-next-lines ()
  (interactive)
  (cl-loop repeat 5 do (next-line)))
(global-set-key (kbd "M-p") 'junhao-prev-lines)
(global-set-key (kbd "M-n") 'junhao-next-lines)




;; ------------------------ EOF ----------------------------
(provide 'init-keybindings)

