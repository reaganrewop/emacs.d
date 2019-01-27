;;; init-helm.el --- Configure keys specific to MacOS -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'helm)
  (when (maybe-require-package 'helm-projectile)
    (require 'helm-config)
    (require 'helm-projectile)

    (when (executable-find "curl")
      (setq helm-google-suggest-use-curl-p t))

    ;; See https://github.com/bbatsov/prelude/pull/670 for a detailed
    ;; discussion of these options.
    (setq helm-split-window-in-side-p           t
	  helm-buffers-fuzzy-matching           t
	  helm-move-to-line-cycle-in-source     t
	  helm-ff-search-library-in-sexp        t
	  helm-ff-file-name-history-use-recentf t)

    ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
    ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
    ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
    (global-set-key (kbd "C-c h") 'helm-command-prefix)
    (global-unset-key (kbd "C-x c"))

    (define-key helm-command-map (kbd "o")     'helm-occur)
    (define-key helm-command-map (kbd "g")     'helm-do-grep)
    (define-key helm-command-map (kbd "C-c w") 'helm-wikipedia-suggest)
    (define-key helm-command-map (kbd "SPC")   'helm-all-mark-rings))

  ;; Projectile cache Settings
  (setq projectile-enable-caching t)

  ;; Helm Everywhere
  (maybe-require-package 'helm-descbinds)
  (maybe-require-package 'helm-ag)
  (require 'helm-eshell)

  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-m") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-h f") 'helm-apropos)
  (global-set-key (kbd "C-h r") 'helm-info-emacs)
  (global-set-key (kbd "C-h C-l") 'helm-locate-library)

  (define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)

  (define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)

  (setq projectile-completion-system 'helm)
  (helm-descbinds-mode)
  (helm-mode 1)

  ;; enable Helm version of Projectile with replacment commands
  (helm-projectile-on))


(provide 'init-helm)
;;; init-helm.el ends here
