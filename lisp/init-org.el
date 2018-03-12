
;; ------------------------ init-org.el ----------------------------

;; 安装最新的org-mode-9.1.7
(add-to-list 'load-path "~/.emacs.d/plugins/org-9.1.7/lisp/")

;; 自动换行？？？ 不知道
;; (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; 直接在org下运行代码
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sh . t)
   (python . t)
   (R . t)
   (ruby . t)
   (ditaa . t)
   (dot . t)
   (octave . t)
   (sqlite . t)
   (perl . t)
   (C . t)
   ))

;; highlight of src codes
(setq org-src-fontify-natively t)

;; output headers with order number
(setq org-export-with-section-numbers t)

;; agenda
(setq org-agenda-files (list "~/Dropbox/org/todo.org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; TODO keywords
(setq org-todo-keyword-faces
      '(("PENDING" . "#27BDAD") ("CANCELED" . "#D33535")
      ))

;; open my todo.org
(defun open-my-todo-org ()
    (interactive)
    (find-file "~/Dropbox/org/todo.org"))
(global-set-key (kbd "C-c t") 'open-my-todo-org)

;; open my note.org
(defun open-my-note-org ()
  (interactive)
  (find-file "~/Dropbox/org/note.org"))
(global-set-key (kbd "C-c n") 'open-my-note-org)

;; ------------------------ EOF ----------------------------
(provide 'init-org)
