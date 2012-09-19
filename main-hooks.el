
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
                php-mode-hook
                python-mode-hook))
              (add-hook hook (lambda ()
                               (run-hooks 'programming-hook))))

;; CC mode programming languages
(defvar c-hook nil
  "Hooks for CC mode programming languages.")

;; (add-hook 'c-hook (lambda()
;;                     (setq c-basic-offset 4)))

;; (dolist (hook '(c-mode-hook
;;                 csharp-mode-hook
;;                 objc-mode-hook
;;                 c++-mode
;;                 java-mode))
;;               (add-hook hook (lambda ()
;;                                (run-hooks 'c-hook))))

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

;; PHP with Drupal coding style
(defconst my-php-style
  '((c-offsets-alist . ((arglist-close . c-lineup-close-paren)))))
(c-add-style "my-php-style" my-php-style)
(add-hook 'php-mode-hook (lambda ()
                           (c-set-offset 'case-label '+)
                           (c-set-offset 'arglist-intro '+)
                           (c-set-offset 'arglist-cont-nonempty 'c-lineup-math)
                           (c-set-style "my-php-style")
                           (setq c-basic-offset 2)))

;; Python
(add-hook 'python-mode-hook (lambda ()
                              (define-key python-mode-map "\C-m"
                                'newline-and-indent)))

;; Erlang
(add-hook 'erlang-mode-hook (lambda ()
                              (setq inferior-erlang-machine-options
                                    '("-sname" "emacs"))))

(provide 'main-hooks)
