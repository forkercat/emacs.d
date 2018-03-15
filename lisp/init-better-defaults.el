
;; ------------------------ init-better-defaults.el ----------------------------

;; horrible-tab
;;(require 'horrible-tab)

;;可怕的缩进 目前没有其他语言缩进
(setq-default indent-tabs-mode nil) ; tab 改为插入空格
(setq default-tab-width 4)
(setq tab-width 4)
(setq c-basic-offset 4) ;;c/c++ 缩进4个空格
(setq c-default-style "linux")   ;;没有这个 { } 就会瞎搞
(setq python-indent 4)
(setq python-indent-guess-indent-offset nil)


;; match
(require 'electric)
(electric-pair-mode t)
(electric-indent-mode t)

;;没有提示音,也不闪屏
(setq ring-bell-function 'ignore)

;;改变emacs固执的yes or no行为
(fset 'yes-or-no-p 'y-or-n-p)

;;显示括号匹配
(show-paren-mode t)

;;但鼠标不会移到匹配括号
(setq show-paren-style 'parenthesis)

;; 在括号内即显示匹配
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))

;;不要生成临时文件
(setq auto-save-default nil)

;; 不生成备份
(setq make-backup-files nil)

;;设置自动保存的目录
;; (setq backup-directory-alist '(("." . "~/.autosave")))

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

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


;; 搜索当前选中区域
(defun occur-dwim ()

  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))


;; case replace
(setq case-replace nil)
(setq case-fold-search nil)


;; winner-mode
(setq winner-dont-bind-my-keys t)
(winner-mode t)


;; ibuffer
(setq ibuffer-expert t)


;; ------------------- big things -------------------

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


;; make comments
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))


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
          (message "Indent selected region -------------------- :)"))
      (progn
        (indent-buffer)
        (message "Indent buffer -------------------- :)")))))


;; switch buffer
;; skip abnormal buffers
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


;; move 5 lines
(defun junhao-prev-lines ()
  (interactive)
  (cl-loop repeat 5 do (previous-line)))

(defun junhao-next-lines ()
  (interactive)
  (cl-loop repeat 5 do (next-line)))


;; window splitting function
(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)


;; subword :: thisVar
(global-subword-mode t)


;; kill whole word :: maybe I'd better use expand region
;; (defun kill-whole-word ()
;;   (interactive)
;;   (backward-word)
;;   (kill-word 1))
;; (global-set-key (kbd "C-c w") 'kill-whole-word)


;; kill-curr-buffer
(defun kill-curr-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-curr-buffer)


;; copy whole line
(defun copy-whole-line ()
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring (point-at-bol) (point-at-eol)))))
(global-set-key (kbd "C-c l") 'copy-whole-line)


;; kill all buffers
(defun kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))



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


;; ------------------------ EOF ----------------------------
(provide 'init-better-defaults)
