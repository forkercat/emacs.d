
;; ------------------------ init-packages.el ----------------------------

;; load-path
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/elpa")

;; melpa
(require 'package)
(package-initialize)
(add-to-list'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(require 'use-package)




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
;; (with-eval-after-load 'flycheck(flycheck-pos-tip-mode))


;; company
(use-package company
  :config
  (global-company-mode t)
  :bind (:map company-active-map
              ("M-n" . nil)
              ("M-p" . nil)
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous))
  )


;; Smex
(use-package smex
  :config
  (smex-initialize)
  :bind (("M-x" . smex)
         ("M-x" . smex-major-mode-commands)
         ("C-c C-c M-x". execute-extended-command)
         )
  )


;; ido-mode
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'always)
(setq ido-enable-last-directory-history nil)
(setq ido-everywhere t)
(setq ido-separator "\n* ")
(ido-mode t)


;; multiple-cursors
(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C-." . mc/mark-next-like-this)
         ("C-," . mc/mark-preivous-like-this)
         ("C-c C-a" . mc/mark-all-like-this)
         )
  )


;; ace-jump-mode
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))


;; popwin
(use-package popwin
  :config
  (popwin-mode 1)
  )


;; window-numbering
(use-package window-numbering
  :config
  (window-numbering-mode 1)
  )


;; reveal-in-osx-finder
(use-package reveal-in-osx-finder
  :bind (("C-c z" . reveal-in-osx-finder))
  )


;; multi-term
(use-package multi-term
  :config
  (progn
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
    )
  :bind (("C-t" . get-term)
         ("M-[" . multi-term-prev)
         ("M-]" . multi-term-next))  
  )


;; web-mode
(use-package web-mode
  :config
  (setq auto-mode-alist
        (append
         '(("\\.html\\'" . web-mode))
         auto-mode-alist))
  )


;; expand-region
(use-package expand-region
  :bind (("S-SPC" . er/expand-region)
         ("M-SPC" . er/contract-region))
  )


;; ------------------------ EOF ----------------------------
(provide 'init-packages)




