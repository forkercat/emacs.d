
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


;; magit
(require 'magit)


;; yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet-snippets")
(require 'yasnippet)
(require 'yasnippet-snippets)
(setf yas/indent-line 'fixed)
(yas/global-mode 1)


;; Smex
(require 'smex) 
(smex-initialize)


;; ido-mode & flx-ido
(require 'flx-ido)
(setq flx-ido-mode t)
(setq ido-enable-flex-matching t)
;; (setq ido-use-filename-at-point 'always)
(setq ido-enable-last-directory-history nil)
(setq ido-everywhere t)
(setq ido-use-faces t)
(ido-mode 1)

;; ido-vertical-mdoe
(ido-vertical-mode t)
(setq ido-vertical-show-count t)


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
(setq ace-jump-mode-submode-list '(ace-jump-word-mode ace-jump-line-mode))


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
(add-to-list 'term-bind-key-alist '("C-q"))

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


;; hideshowvis
(require 'hideshowvis)
(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")
(autoload 'hideshowvis-minor-mode
  "hideshowvis"
  "Will indicate regions foldable with hideshow in the fringe."
  'interactive)
(dolist (hook (list 'emacs-lisp-mode-hook
                    'c++-mode-hook
                    'c-mode-hook
                    'cc-mode-hook
                    'python-mode-hook
                    'html-mode-hook
                    'web-mode-hook))
  (add-hook hook 'hideshowvis-enable))


;; hideshow
(require 'hideshow)
(setq hs-allow-nesting t)
(add-hook 'c-mode-common-hook
          (lambda ()
            (hs-minor-mode 1)
            ))
(add-hook 'emacs-lisp-mode-hook
          (lambda()
            (hs-minor-mode 1)))
(add-hook 'cc-mode-common-hook
          (lambda ()
            (hs-minor-mode 1)
            ))
(add-hook 'c++-mode-common-hook
          (lambda ()
            (hs-minor-mode 1)
            ))
(add-hook 'python-mode-common-hook
          (lambda ()
            (hs-minor-mode 1)
            ))


;; rainbow-mode
;; rainbow-mode isn't a global minor mode, so it needs to be enabled on a per-buffer basis.
(require 'rainbow-mode)
;; conflict with magit
;;(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
;;  (lambda () (rainbow-mode 1)))
;;(my-global-rainbow-mode 1)


;; smart-hungry-delete
(require 'smart-hungry-delete)
(smart-hungry-delete-add-default-hooks)
(global-set-key (kbd "C-c <backspace>") 'smart-hungry-delete-backward-char)
(global-set-key (kbd "C-c d") 'smart-hungry-delete-forward-char)


;; swiper
(require 'swiper)
(global-set-key (kbd "C-s") 'swiper)


;; projectile
(require 'projectile)
(projectile-mode)


;; dumb-jump
(dumb-jump-mode)
(setq dumb-jump-prefer-searcher 'ag)


;; diminish
(require 'diminish)
(diminish 'abbrev-mode)
(diminish 'projectile-mode "pj")


;; ------------------------------- code --------------------------------


;; elpy
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-promp"
      python-shell-prompt-detect-enabled nil
      python-shell-completion-native-enable nil)
(setq elpy-rpc-backend "jedi")
(setq elpy-remove-modeline-lighter nil)
(elpy-enable)
;;(setq python-shell-interpreter "python"
;;      python-shell-interpreter-args "-i"

;; damn it! Fixed the coding issue in Chinese
(setenv "LANG" "en_US.UTF-8")
(setenv "PYTHONIOENCODING" "utf-8")


;; flycheck
(require 'flycheck)
(global-flycheck-mode t)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; flycheck-pos-tip
(with-eval-after-load 'flycheck(flycheck-pos-tip-mode))


;; company & company-irony
(global-company-mode t)
(setq company-idle-delay 0)
(setq company-show-numbers t)
(setq company-minimum-prefix-length 2)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'irony-modo-hook 'irony-cdb-autosetup-compile-options)


;; virtualenvwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq venv-location "~/.virtualenvs/")
;;  workon "dev"
(pyvenv-workon "dev")



;; ein
;;(require 'ein)


;; ------------------------ EOF ----------------------------
(provide 'init-packages)



