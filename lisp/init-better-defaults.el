
;; ------------------------ init-better-defaults.el ----------------------------

;; -------------- for org-mode ----------------
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

;; -------------- ending of org config -------------


;;关闭烦人的出错时的提示音
;;(setq visible-bell t)

;;没有提示音,也不闪屏
(setq ring-bell-function 'ignore)


;;改变emacs固执的yes or no行为
(fset 'yes-or-no-p 'y-or-n-p)

;;显示括号匹配
(show-paren-mode t)

;;但鼠标不会移到匹配括号
(setq show-paren-style 'parenthesis)

;;不要生成临时文件
(setq auto-save-default nil)

;; 不生成备份
(setq make-backup-files nil)

;;设置自动保存的目录
;; (setq backup-directory-alist '(("." . "~/.autosave")))

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;;设置tab宽度为4
(setq-default indent-tabs-mode nil)
(setq tab-width 4 c-basic-offset 4)

;; restore current workplace
(desktop-save-mode t)

;; match
(electric-pair-mode t)
(electric-indent-mode t)

;; continuous scrolling
(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)

;; smooth scrolling when using mouse
(setq mouse-wheel-scroll-amount '(0.04))
(setq mouse-wheel-progressive-speed nil)

;; open recent files
(require 'recentf)
(recentf-mode 1)
(setq rectf-max-menu-item 25)

;; 选中删除
(delete-selection-mode t)

;; ???
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; auto reload files that have been modified beyond emacs
(global-auto-revert-mode t)


;; abbrev-mode
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
                                            ("xmail" "junhaowww@outlook.com")
                                            ("xname" "Junhao Wang")
                                            ))


;; dired-mode
(put 'dired-find-alternate-file 'disabled nil)
;; 延迟加载
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))



;; -------------- coding system ----------------


;;新建文件的编码方式
(set-terminal-coding-system 'utf-8)

;;写文件的编码方式  
;;(set-buffer-file-coding-system 'gb2312)  
(set-buffer-file-coding-system 'utf-8)  

;;新建文件的编码方式  
;;(setq default-buffer-file-coding-system 'gb2312)  
(setq default-buffer-file-coding-system 'utf-8)

;;键盘输入的编码方式  
;;(set-keyboard-coding-system 'gb2312)   
(set-keyboard-coding-system 'utf-8)   

;;读取或写入文件名的编码方式  
(setq file-name-coding-system 'utf-8)   

;; 终端中文乱码??? 无法解决
(set-terminal-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))


;; ------------------------ EOF ----------------------------
(provide 'init-better-defaults)
