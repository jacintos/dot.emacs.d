
;; Autoload php-mode with Drupal additions
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(autoload 'erlang-mode "erlang" "Major mode for editing Erlang code." t)
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(autoload 'sass-mode "sass-mode" "Major mode for editing Sass files." t )

(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.module$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.install$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.theme$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.info$" . conf-windows-mode))
(add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl$" . erlang-mode))

(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))

(provide 'main-modes)
