
;; ------------------------ init-packages.el ----------------------------

(add-to-list 'load-path "~/.emacs.d/plugins")


(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(
                           ("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ("melpa-china" . "http://elpa.emacs-china.org/melpa/")
                           ("melpa-milkbox" . "http://melpa.milkbox.net/packages/")
                           ("melpa" . "http://melpa.org/packages/")
                           ("melpa-stable" . "http://stable.melpa.org/packages/"))))


;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
                      ;; --- Auto-completion ---
                      company
                      ;; --- Better Editor ---
                      popwin		
                      smartparens
                      ;; --- Major Mode ---
                      ;;js2-mode
                      markdown-mode
                      ;; --- Minor Mode ---
                      nodejs-repl
                      exec-path-from-shell
                      ;; --- Themes ---
                      ;;monokai-theme
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


;; yasnippet
;;(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
;;(require 'yasnippet)
;;(yas/global-mode 1)


;; auto-complete
;;(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20160416.604")
;;(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20160416.604/dict")
;;(ac-config-default)
;;(define-key ac-complete-mode-map "\C-n" 'ac-next)
;;(define-key ac-complete-mode-map "\C-p" 'ac-previous)
;;(global-auto-complete-mode t)
;;(setq ac-dwim t)
;;(setq ac-delay 0)
;;(define-key ac-completing-map "\t" 'ac-complete)
;;(setq ac-menu-height 10)
;;(setq ac-auto-show-menu 0)
;;(setq ac-ignore-case t)

;; flycheck
;;(global-flycheck-mode t)


;; flycheck-pos-tip
(with-eval-after-load 'flycheck(flycheck-pos-tip-mode))

;; company
(global-company-mode t)

;; Smex
(require 'smex) 
;; Not needed if you use package.el
(smex-initialize)
;; Can be omitted. This might cause a (minimal) delay
;; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; C-h w to see the shortcut of the key   or + f

;; ido-mode
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'always)
(setq ido-enable-last-directory-history nil)
(setq ido-everywhere t)
(setq ido-separator "\n* ")
(defun bind-ido-keys ()
  "Keybindings for ido mode."
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match) 
  (define-key ido-completion-map (kbd "C-p")   'ido-prev-match))
(add-hook 'ido-setup-hook #'bind-ido-keys)
(ido-mode 1)


;; multiple-cursors
(require 'multiple-cursors)
;; multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)  ;; don't know how to use
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-a") 'mc/mark-all-like-this)


;; ace-jump-mode
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)


;; popwin
(require 'popwin)
(popwin-mode 1)


;; window-numbering
(require 'window-numbering)  
(window-numbering-mode 1)
(require 'reveal-in-osx-finder)
(global-set-key (kbd "C-c z") 'reveal-in-osx-finder)

;; multi-term
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(setq multi-term-buffer-name "bad-term")
;; Use Emacs terminfo, not system terminfo, mac系统出现了4m
(setq system-uses-terminfo nil)
(global-set-key (kbd "C-t") 'multi-term)
(global-set-key (kbd "M-[") 'multi-term-prev)
(global-set-key (kbd "M-]") 'multi-term-next)
;; term-bind-key
(add-to-list 'term-bind-key-alist '("C-t"))




;; ------------------------ EOF ----------------------------
(provide 'init-packages)




