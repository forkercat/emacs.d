
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

;; TODO keywords
(setq org-todo-keyword-faces
      '(("PENDING" . "#27BDAD") ("CANCELED" . "#D33535")
        ))

;; open my todo.org
(defun open-my-todo-org ()
  (interactive)
  (find-file "~/Dropbox/org/todo.org"))

;; open my note.org
(defun open-my-note-org ()
  (interactive)
  (find-file "~/Dropbox/org/note.org"))

;; open in the current window
(setq org-agenda-window-setup 'current-window)


;; org-capture
(setq org-default-notes-file (concat org-directory "~/Dropbox/org/todo.org"))

(setq org-capture-templates
      '(
        ("i" "inbox/quick qotes" entry (file+headline "~/Dropbox/org/todo.org" "Quick Notes") "* %?\n\n")
        ("r" "reminder" entry (file+headline "~/Dropbox/org/todo.org" "Reminder") "* %?\n\n")       
        ("s" "todo (study)" entry (file+headline "~/Dropbox/org/todo.org" "Other(Study)") "* TODO %?\n\n")
        ("t" "todo (little stuff)" entry (file+headline "~/Dropbox/org/todo.org" "Reminder") "* TODO %?\n\n")
        ("n" "note" entry (file+headline "~/Dropbox/org/note.org" "Uncategorized") "* %?\n\n")
        ))

;; src-templates
(add-to-list 'org-structure-template-alist
             '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC")
             '("py" "#+BEGIN_SRC python\n?\n#+END_SRC"))

;; visual-line-mode
(add-hook 'org-mode-hook '(lambda () (visual-line-mode 1)))


;; image size - not working
;; (setq org-image-actual-width nil)
;; (image-type-available-p 'imagemagick)


;; latex-preview
(setq org-latex-create-formula-image-program 'dvipng)

;;(setq org-latex-image-default-width ".20\\linewidth")

;; set env variable for texlive
(let (
      (my-paths
       '("~/bin"
         "/usr/local/bin"
         "/usr/bin"
         "/Library/TeX/texbin" ; add path to basictex bin
         "/usr/local/texlive/2017basic/bin"
         "/bin"
         )))
  (setenv "PATH" (concat (getenv "PATH") ":"
                         (mapconcat 'identity my-paths ":")))
  (setq exec-path (append my-paths (list "." exec-directory))))



;; ------------------------ EOF ----------------------------
(provide 'init-org)
