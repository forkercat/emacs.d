
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
(global-set-key (kbd "M-l") 'ace-jump-line-mode)
(global-set-key (kbd "M-s") 'ace-jump-mode)

;; indent-region
(global-set-key (kbd "M-s-ƒ") 'indent-region-or-buffer)

;; move 5 lines
(global-set-key (kbd "M-p") 'junhao-prev-lines)
(global-set-key (kbd "M-n") 'junhao-next-lines)

;; reveal-in-osx-finder
(global-set-key (kbd "C-c z") 'reveal-in-osx-finder)

;; multi-term
(global-set-key (kbd "C-t") 'get-term)
(global-set-key (kbd "M-[") 'multi-term-prev)
(global-set-key (kbd "M-]") 'multi-term-next)

;; occur-dwim
(global-set-key (kbd "M-o") 'occur-dwim)

;; company mode
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-t") 'company-search-toggle-filtering)
  (define-key company-active-map [tab] 'company-complete-selection)
  )

;; expand-region
(global-set-key (kbd "C-q") 'er/expand-region)
(global-set-key (kbd "S-SPC") 'er/expand-region)
(global-set-key (kbd "C-c q") 'er/contract-region)
;; (global-set-key (kbd "C-q") 'open-line) ;; to replace C-o

;; windresize
(global-set-key (kbd "C-c w") 'windresize)

;; winner mode
(global-set-key (kbd "C-x <left>") 'winner-undo)
(global-set-key (kbd "C-x <right>") 'winner-redo)

;; windmove - not convenient
;;(global-set-key (kbd "C-M-f") 'windmove-right)
;;(global-set-key (kbd "C-M-b") 'windmove-left)
;;(global-set-key (kbd "C-M-n") 'windmove-down)
;;(global-set-key (kbd "C-M-p") 'windmove-up)

;; org-mode
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c t") 'open-my-todo-org)
(global-set-key (kbd "C-c n") 'open-my-note-org)
(global-set-key (kbd "C-c c") 'org-capture)

;; popup-kill-ring
(global-set-key (kbd "M-y") 'popup-kill-ring)

;; ibuffer + ido buffer switching
(global-set-key (kbd "C-x b") 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

;; dumb-jump-mode
(global-set-key (kbd "M-g o") 'dumb-jump-go-other-window)
(global-set-key (kbd "M-g j") 'dumb-jump-go)
(global-set-key (kbd "M-g i") 'dumb-jump-go-prompt)
(global-set-key (kbd "M-g x") 'dumb-jump-go-prefer-external)
(global-set-key (kbd "M-g z") 'dumb-jump-go-prefer-external-other-window)

;; elpy
(define-key elpy-mode-map (kbd "C-c C-d") nil)
(define-key elpy-mode-map (kbd "M-RET") 'elpy-shell-send-region-or-buffer)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
(define-key elpy-mode-map (kbd "M-.") 'elpy-goto-definition)
(define-key elpy-mode-map (kbd "M-,") 'pop-tag-mark)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; uimage
(define-key uimage-mode-map (kbd "C-c p") 'uimage-display-images)

;; matlab-mode
(define-key matlab-mode-map (kbd "s-r") 'matlab-shell-run-region-or-line)

;; ------------------------ EOF ----------------------------
(provide 'init-keybindings)
