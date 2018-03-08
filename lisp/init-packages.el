
;; ------------------------ init-packages.el ----------------------------


 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
                ;swiper
		;counsel
		smartparens
		;; --- Major Mode ---
                ;js2-mode
                markdown-mode
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		;; --- Themes ---
		;monokai-theme
		;; solarized-theme
		) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))



;; ------------------------ package details ----------------------------


;; melpa package
;(require 'package)
;(add-to-list 'package-archives
;             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;(package-initialize)
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


;; Smex
(require 'smex) 
; Not needed if you use package.el
(smex-initialize)
; Can be omitted. This might cause a (minimal) delay
; when Smex is auto-initialized on its first run.


;; ido-mode
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-everywhere t)          
(ido-mode 1)





;; ------------------------ EOF ----------------------------
(provide 'init-packages)




