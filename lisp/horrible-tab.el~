;; turn on transient mark mode
;;(that is, we highlight the selected text)
(transient-mark-mode t)

(setq my-tab-width 2)

(defun indent-block()
  (shift-region my-tab-width)
  (setq deactivate-mark nil))

(defun unindent-block()
  (shift-region (- my-tab-width))
  (setq deactivate-mark nil))

(defun shift-region(numcols)
" my trick to expand the region to the beginning and end of the area selected
 much in the handy way I liked in the Dreamweaver editor."
  (if (< (point)(mark))
    (if (not(bolp))    (progn (beginning-of-line)(exchange-point-and-mark) (end-of-line)))
    (progn (end-of-line)(exchange-point-and-mark)(beginning-of-line)))
  (setq region-start (region-beginning))
  (setq region-finish (region-end))
  (save-excursion
    (if (< (point) (mark)) (exchange-point-and-mark))
    (let ((save-mark (mark)))
      (indent-rigidly region-start region-finish numcols))))

(defun indent-or-complete ()
  "Indent region selected as a block; if no selection present either indent according to mode,
or expand the word preceding point. "
  (interactive)
  (if  mark-active
      (indent-block)
    (if (looking-at "\\>")
  (hippie-expand nil)
      (insert "\t"))))

(defun my-unindent()
  "Unindent line, or block if it's a region selected.
When pressing Shift+tab, erase words backward (one at a time) up to the beginning of line.
Now it correctly stops at the beginning of the line when the pointer is at the first char of an indented line. Before the command would (unconveniently)  kill all the white spaces, as well as the last word of the previous line."

  (interactive)
  (if mark-active
      (unindent-block)
    (progn
      (unless(bolp)
        (if (looking-back "^[ \t]*")
            (progn
              ;;"a" holds how many spaces are there to the beginning of the line
              (let ((a (length(buffer-substring-no-properties (point-at-bol) (point)))))
                (progn
                  ;; delete backwards progressively in my-tab-width steps, but without going further of the beginning of line.
                  (if (> a my-tab-width)
                      (delete-backward-char my-tab-width)
                    (backward-delete-char a)))))
          ;; delete tab and spaces first, if at least 2 exist, before removing words
          (progn
            (if(looking-back "[ \t]\\{2,\\}")
                (delete-horizontal-space)
              (backward-kill-word 1))))))))

(add-hook 'find-file-hooks (function (lambda ()
 (unless (eq major-mode 'org-mode)
(local-set-key (kbd "<tab>") 'indent-or-complete)))))

(if (not (eq  major-mode 'org-mode))
    (progn
      (define-key global-map "\t" 'indent-or-complete) ;; with this you have to force tab (C-q-tab) to insert a tab after a word
      (define-key global-map [S-tab] 'my-unindent)
      (define-key global-map [C-S-tab] 'my-unindent)))

;; mac and pc users would like selecting text this way
(defun dave-shift-mouse-select (event)
 "Set the mark and then move point to the position clicked on with
 the mouse. This should be bound to a mouse click event type."
 (interactive "e")
 (mouse-minibuffer-check event)
 (if mark-active (exchange-point-and-mark))
 (set-mark-command nil)
 ;; Use event-end in case called from mouse-drag-region.
 ;; If EVENT is a click, event-end and event-start give same value.
 (posn-set-point (event-end event)))

;; be aware that this overrides the function for picking a font. you can still call the command
;; directly from the minibufer doing: "M-x mouse-set-font"
(define-key global-map [S-down-mouse-1] 'dave-shift-mouse-select)

;; to use in into emacs for  unix I  needed this instead
; define-key global-map [S-mouse-1] 'dave-shift-mouse-select)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; this final line is only necessary to escape the *scratch* fundamental-mode
;; and let this demonstration work
(text-mode)
