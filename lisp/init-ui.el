
;; ------------------------ init-ui.el ----------------------------

;;改变emacs标题栏的标题
(setq frame-title-format "emacs@junhaow")

;; Display line/column number
;; (global-linum-mode t)
(line-number-mode t)
(column-number-mode t)

;;设置窗口位置
(set-frame-position (selected-frame) 1282 40)

;;设置窗口宽高
(set-frame-width (selected-frame) 75)
(set-frame-height (selected-frame) 60)

;;关闭emacs启动时的画面
(setq inhibit-startup-message t)

;;显示80列就换行
(setq default-fill-column 80)

;;光标闪烁频率
(setq blink-cursor-interval 0.21)

;;光标一直闪烁
(setq blink-cursor-blinks 0)

;;光标靠近鼠标时自动移开鼠标
(mouse-avoidance-mode 'animate)


;; Theme

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (defvar zenburn-override-colors-alist
;;   '(
;;     ("zenburn-bg+2"  . "#BFBFBF")))
(load-theme 'zenburn t)

;; (custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.

 ;; '(ansi-color-faces-vector
;; [default default default italic underline success warning error])
 ;; '(ansi-color-names-vector
   ;; ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
;; '(custom-enabled-themes (quote (wheatgrass)))
 ;; '(package-selected-packages (quote (company))))
;; (custom-set-faces)

 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.


;; set font size
(set-default-font "Monaco 15")

;; highlight current line

;; (global-hl-line-mode t)
;; set highlight color for the line
;; (set-face-background 'hl-line "#0D0D0D")     ; #07243c
;; keep syntax highlighting in the current line
;; (set-face-foreground 'highlight nil)


;; set cursor color
(setq evil-default-cursor t)
(set-cursor-color "#E1E1E1")

;; set font-face of headers in org-mode
(set-face-attribute 'org-level-1 nil :height 1.1 :bold t)
(set-face-attribute 'org-level-2 nil :height 1.1 :bold t)
(set-face-attribute 'org-level-3 nil :height 1.0 :bold t)
(set-face-attribute 'org-level-4 nil :height 1.0 :bold t)
(set-face-attribute 'org-level-5 nil :height 1.0 :bold t)
(set-face-attribute 'org-level-6 nil :height 1.0 :bold t)


;; background color
(set-background-color "#101010")  ; black


;; ------------------------ EOF ----------------------------
(provide 'init-ui)
