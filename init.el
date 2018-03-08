
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; Filename:      .emacs  
;;                  
;; Copyright (C) 2018,  Junhao  
;; Author:        Junhao <junhaowww@outlook.com>
;; Created at:    Fri Aug 15 12:00:07 2014
;;                  
;; Description:   这是我自己的emacs配置文件
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;; ------------------------ Basic Config ----------------------------


;; Display Line of Numbers
(global-linum-mode t)

;;设置窗口位置
(set-frame-position (selected-frame) 300 60)
;;设置窗口宽高
(set-frame-width (selected-frame) 85)
(set-frame-height (selected-frame) 60)

;;关闭烦人的出错时的提示音
;;(setq visible-bell t)

;;没有提示音,也不闪屏
(setq ring-bell-function 'ignore)

;;关闭emacs启动时的画面
(setq inhibit-startup-message t)

;;改变emacs固执的yes or no行为
(fset 'yes-or-no-p 'y-or-n-p)

;;显示括号匹配
(show-paren-mode t)
;;但鼠标不会移到匹配括号
(setq show-paren-style 'parenthesis)
;;不要生成临时文件
(setq-default make-backup-files nil)
;;设置自动保存的目录
;(setq backup-directory-alist '(("." . "~/.autosave")))
;; 不生成备份
(setq make-backup-files nil)

;;时间显示
;;(display-time-mode 1)

;;改变emacs标题栏的标题
(setq frame-title-format "Junhao's Cracking Emacs")

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;;设置tab宽度为4
(setq-default indent-tabs-mode nil)
(setq tab-width 4 c-basic-offset 4)


;;新建文件的编码方式
(set-terminal-coding-system 'utf-8)

;;写文件的编码方式  
;;(set-buffer-file-coding-system 'gb2312)  
(set-buffer-file-coding-system 'utf-8)  
  
;;新建文件的编码方式  
;;(setq default-buffer-file-coding-system 'gb2312)  
(setq default-buffer-file-coding-system 'utf-8)
  
;;终端方式的编码方式  
(set-terminal-coding-system 'utf-8)  
  
;;键盘输入的编码方式  
;;(set-keyboard-coding-system 'gb2312)   
(set-keyboard-coding-system 'utf-8)   
      
;;读取或写入文件名的编码方式  
(setq file-name-coding-system 'utf-8)   

;;显示80列就换行
(setq default-fill-column 80)

;;光标闪烁频率
(setq blink-cursor-interval 0.25)

;;光标一直闪烁
(setq blink-cursor-blinks 0)

;;光标靠近鼠标时自动移开鼠标
(mouse-avoidance-mode 'animate)


;; restore current workplace
(desktop-save-mode t)

;; match
(electric-pair-mode t)
(electric-indent-mode t)

;; shortcut
(global-set-key (kbd "M-p") 'backward-sentence)
(global-set-key (kbd "M-n") 'forward-sentence)

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
(setq rectf-max-menu-item 10)


;; like other editors, when you input a character in a selected region, it will replace all selected words with the character
(delete-selection-mode 1)



;; ------------------------ Theme ----------------------------


;; Theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(package-selected-packages (quote (company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; set font size
(set-face-attribute 'default nil :font "Menlo-13")


;; highlight current line
(global-hl-line-mode t)
;; set highlight color for the line
(set-face-background 'hl-line "#171717")     ; #07243c
;; keep syntax highlighting in the current line
(set-face-foreground 'highlight nil)


;; set cursor color
(set-cursor-color "#efefef")


;; ------------------------ Package ----------------------------


;; melpa package
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
;(setq url-http-attempt-keepalives nil)


;; yasnippet
;(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
;(require 'yasnippet)
;(yas/global-mode 1)


;; auto-complete
;(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20160416.604")
;(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20160416.604/dict")
;(ac-config-default)
;(define-key ac-complete-mode-map "\C-n" 'ac-next)
;(define-key ac-complete-mode-map "\C-p" 'ac-previous)
;(global-auto-complete-mode t)
;(setq ac-dwim t)
;(setq ac-delay 0)
;(define-key ac-completing-map "\t" 'ac-complete)
;(setq ac-menu-height 10)
;(setq ac-auto-show-menu 0)
;(setq ac-ignore-case t)


;; flycheck
;(global-flycheck-mode t)


;; flycheck-pos-tip
;(with-eval-after-load 'flycheck(flycheck-pos-tip-mode))

;; comment
;(global-set-key [?\C-c ?\C-/] 'comment-or-uncomment-region)


;; company
(global-company-mode t)
