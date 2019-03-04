;; Packages and package configuration ======================

(prelude-require-packages '(terraform-mode company-terraform))

(with-eval-after-load 'terraform-mode
  (company-terraform-init)
  (add-hook 'terraform-mode-hook #'terraform-format-on-save-mode))
