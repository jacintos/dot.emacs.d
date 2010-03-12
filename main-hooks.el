
;; All programming modes
(defvar programming-hook nil
  "Hooks for programming modes.")

(add-hook 'programming-hook (lambda ()
                              (hl-line-mode t)
                              (column-number-mode 1)))

(dolist (hook '(scheme-mode-hook
                emacs-lisp-mode-hook
                lisp-mode-hook
                erlang-mode-hook
                python-mode-hook))
              (add-hook hook (lambda ()
                               (run-hooks 'programming-hook))))

;; Lisp modes
(defvar lisp-hook nil
  "Hooks for lisp modes.")

(add-hook 'lisp-hook (lambda ()
                       (show-paren-mode 1)))

(dolist (hook '(scheme-mode-hook
                emacs-lisp-mode-hook
                lisp-mode-hook))
              (add-hook hook (lambda ()
                               (run-hooks 'lisp-hook))))

;; Python
(add-hook 'python-mode-hook (lambda ()
                              (define-key python-mode-map "\C-m"
                                'newline-and-indent)))

;; Erlang
(add-hook 'erlang-mode-hook (lambda ()
                              (setq inferior-erlang-machine-options
                                    '("-sname" "emacs"))))

(provide 'main-hooks)
