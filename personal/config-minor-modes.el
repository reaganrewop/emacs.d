;;;;;;;;;;;;;;;;
;; ;; neotree ;;
;;;;;;;;;;;;;;;;

(prelude-require-package 'neotree)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; multi cursor mode  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prelude-require-package 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

; (define-key mc/keymap (kbd "<return>") nil) ;; make <return> insert a newline; multiple-cursors-mode can still be disabled with C-g.
