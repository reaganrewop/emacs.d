;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org mode configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prelude-require-package 'org-bullets)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))



;; Run/Highlight code using babel in org-mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (python . t)
   (plantuml . t)
   ;; Include other languages here...
   ))
;; Syntax highlight in #+BEGIN_SRC blocks
(setq org-src-fontify-natively t)
;; Don't prompt before running code in org
(setq org-confirm-babel-evaluate nil)
;; Fix an incompatibility between the ob-async and ob-ipython packages
(setq ob-async-no-async-languages-alist '("ipython"))
