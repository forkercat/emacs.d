
;; ------------------------ init-packages.el ----------------------------

(add-to-list 'load-path "~/.emacs.d/plugins")


(when (>= emacs-major-version 24)
  (require 'package)

  (setq package-archives '(
                           ;;("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ;;("melpa-china" . "http://elpa.emacs-china.org/melpa/")
                           ("melpa-milkbox" . "http://melpa.milkbox.net/packages/")
                           ;;("melpa" . "http://melpa.org/packages/")
                           ("melpa-stable" . "http://stable.melpa.org/packages/"))))
  
  (package-initialize)

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
                      markdown-mode
                      ;; --- Minor Mode ---
                      exec-path-from-shell
                      flycheck
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
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet-snippets")
(require 'yasnippet)
(require 'yasnippet-snippets)
(setf yas/indent-line 'fixed)
(yas/global-mode 1)


;; flycheck
(require 'flycheck)
;; (global-flycheck-mode t)
(add-hook 'after-init-hook #'global-flycheck-mode)


;; flycheck-pos-tip
;;(with-eval-after-load 'flycheck(flycheck-pos-tip-mode))


;; company
(global-company-mode t)


;; Smex
(require 'smex) 
(smex-initialize)


;; ido-mode
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'always)
(setq ido-enable-last-directory-history nil)
(setq ido-everywhere t)
(setq ido-separator "\n* ")
(ido-mode 1)


;; multiple-cursors
(require 'multiple-cursors)


;; ace-jump-mode
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
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


;; popwin
(require 'popwin)
(popwin-mode 1)


;; window-numbering
(require 'window-numbering)  
(window-numbering-mode 1)


;; reveal-in-osx-finder
(require 'reveal-in-osx-finder)


;; multi-term
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(setq multi-term-buffer-name "bad-term")
;; Use Emacs terminfo, not system terminfo, mac系统出现了4m
(setq system-uses-terminfo nil)


;; term-bind-key
(add-to-list 'term-bind-key-alist '("C-t"))

(defun last-term-buffer (l)
  "Return most recently used term buffer."
  (when l
    (if (eq 'term-mode (with-current-buffer (car l) major-mode))
        (car l) (last-term-buffer (cdr l)))))

(defun get-term ()
  "Switch to the term buffer last used, or create a new one if
    none exists, or if the current buffer is already a term."
  (interactive)
  (let ((b (last-term-buffer (buffer-list))))
    (if (or (not b) (eq 'term-mode major-mode))
        (progn (multi-term)
               (message "create a new multi-term!"))
      (progn (switch-to-buffer b)
             (message "switch a exist multi-term!")))))


;; web-mode
(require 'web-mode)
(setq auto-mode-alist
      (append
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))


;; expand-region
(require 'expand-region)



;; windresize
(require 'windresize)






;; ------------------------ EOF ----------------------------
(provide 'init-packages)




