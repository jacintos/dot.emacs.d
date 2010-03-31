
;; All programming modes
(defvar programming-hook nil
  "Hooks for programming modes.")

(add-hook 'programming-hook (lambda ()
                              (hl-line-mode t)
                              (column-number-mode 1)))

(dolist (hook '(scheme-mode-hook
                emacs-lisp-mode-hook
                lisp-mode-hook
                c-mode-hook
                csharp-mode-hook
                objc-mode-hook
                c++-mode
                java-mode
                erlang-mode-hook
                python-mode-hook))
              (add-hook hook (lambda ()
                               (run-hooks 'programming-hook))))

;; CC mode programming languages
(defvar c-hook nil
  "Hooks for CC mode programming languages.")

(add-hook 'c-hook (lambda()
                    (setq c-basic-offset 4)))

(dolist (hook '(c-mode-hook
                csharp-mode-hook
                objc-mode-hook
                c++-mode
                java-mode))
              (add-hook hook (lambda ()
                               (run-hooks 'c-hook))))

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

;; Conditionally load nXhtml to keep startup fast
(setq nxhtml-load-pattern ".+\\.\\(ctp\\|html?\\|xhtml\\)$")
(defun load-nxhtml-if-required ()
  (if (and (string-match nxhtml-load-pattern (buffer-file-name))
           (not (featurep 'nxhtml-autostart)))
      (progn
        (load (expand-file-name "~/.emacs.d/site-lisp/nxhtml/autostart.el"))
        ; nXhtml claims PHP files for itself and I don't quite like that
        (dolist (rec auto-mode-alist)
          (when (string-match ".*\\.php.*$" (car rec))
            (setcdr rec 'php-mode))))))

(add-hook 'find-file-hook 'load-nxhtml-if-required)

(provide 'main-hooks)
