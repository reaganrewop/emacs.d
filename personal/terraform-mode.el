;; Packages and package configuration ======================
(prelude-require-packages '(terraform-mode company-terraform))

(add-hook 'terraform-mode (lambda ()
                            ()
                            (terraform-format-on-save-mode)
                            (company-terraform-init)))
