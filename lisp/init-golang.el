;;; init-golang.el --- Emacs: Go programming support.
;;
;; Author: Karthik Muralidharan
;; Version: 1.0.0
;; Keywords: convenience go

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Init configuration for Go

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(when (maybe-require-package 'go-mode)
  (maybe-require-package 'go-eldoc)
  (maybe-require-package 'gotest)
  (maybe-require-package 'go-projectile)
  (maybe-require-package 'auto-complete)
  (maybe-require-package 'go-autocomplete)
  (require 'go-projectile)
  (require 'go-autocomplete)

  (after-load 'go-mode
    ;; Prefer goimports to gofmt if installed
    (let ((goimports (executable-find "goimports")))
      (when goimports
        (setq gofmt-command goimports)))

    ;; El-doc for Go
    (go-eldoc-setup)

    ;; CamelCase aware editing operations
    (subword-mode +1)

    ;; Ignore go test -c output files
    (add-to-list 'completion-ignored-extensions ".test")

    (setq-default tab-width 4)

    (define-key 'help-command (kbd "G") 'godoc)

    ;; Add to default go-mode key bindings
    (let ((map go-mode-map))
      (define-key map (kbd "C-c a") 'go-test-current-project) ;; current package, really
      (define-key map (kbd "C-c m") 'go-test-current-file)
      (define-key map (kbd "C-c .") 'go-test-current-test)
      (define-key map (kbd "C-c b") 'go-run)
      (define-key map (kbd "C-h f") 'godoc-at-point)
      (define-key map (kbd "M-.") 'godef-jump) ; Go to definition
      (define-key map (kbd "M-*") 'pop-tag-mark) ; Return from whence you came
      (define-key map (kbd "M-p") 'compile)      ; Invoke compiler
      (define-key map (kbd "M-P") 'recompile) ; Redo most recent compile cmd
      (define-key map (kbd "M-]") 'next-error) ; Go to next error (or msg)
      (define-key map (kbd "M-[") 'previous-error) ; Go to previous error or msg
      )

    ;; guru settings
    (go-guru-hl-identifier-mode)        ; highlight identifiers

    ;; Hooks for Go mode
    (add-hook 'before-save-hook 'gofmt-before-save) ; gofmt before every save
    (add-hook 'go-mode-hook (lambda ()
                              (auto-complete-mode 1)))
    )

  (provide 'init-golang))
;;; init-golang.el ends here
