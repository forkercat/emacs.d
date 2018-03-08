


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; Filename:      init.el  
;;                  
;; Copyright (C) 2018,  Junhao  
;; Author:        Junhao <junhaowww@outlook.com>
;; Created at:    Fri Aug 15 12:00:07 2014
;;                  
;; Description:   This is my emacs config~
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; init-packages.el        # 插件管理
;; init-ui.el              # 视觉层配置
;; init-better-defaults.el # 增强内置功能
;; init-keybindings.el     # 快捷键绑定
;; init-org.el             # Org 模式相关的全部设定
;; custom.el              # 存放使用编辑器接口产生的配置信息
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")
;;
;; Package Management
;; -----------------------------------------------------------------
;;
(require 'init-packages)
(require 'init-better-defaults)
(require 'init-ui)
(require 'init-keybindings)
(require 'init-org)
(require 'custom)


;; ------------------------ EOF ----------------------------
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
 '(package-selected-packages
   (quote
    (magit multiple-cursors company smartparens markdown-mode nodejs-repl exec-path-from-shell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
