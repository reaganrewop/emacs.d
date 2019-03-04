; Mac specfic bindings
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; GLOBAL

; Kill this buffer
(defun custom/kill-this-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x k") 'custom/kill-this-buffer)


; switch to minibuffer
(defun switch-to-minibuffer-window ()
  "switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-window (active-minibuffer-window))))

(global-set-key (kbd "<f7>") 'switch-to-minibuffer-window)
