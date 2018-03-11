
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

;; smex-mode
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; ido-mode
(defun bind-ido-keys ()
  "Keybindings for ido mode."
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match) 
  (define-key ido-completion-map (kbd "C-p")   'ido-prev-match))
(add-hook 'ido-setup-hook #'bind-ido-keys)

;; ace-jump-mode
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)  ;; don't know how to use
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-a") 'mc/mark-all-like-this)

;; ace-jump-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; indent-region
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; move 5 lines
(global-set-key (kbd "M-p") 'junhao-prev-lines)
(global-set-key (kbd "M-n") 'junhao-next-lines)

;; reveal-in-osx-finder
(global-set-key (kbd "C-c z") 'reveal-in-osx-finder)

;; multi-term
(global-set-key (kbd "C-t") 'get-term)
(global-set-key (kbd "M-[") 'multi-term-prev)
(global-set-key (kbd "M-]") 'multi-term-next)



;; ------------------------ EOF ----------------------------
(provide 'init-keybindings)

