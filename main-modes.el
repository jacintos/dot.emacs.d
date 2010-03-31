
;; Autoload php-mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; nXhtml
(add-to-list 'auto-mode-alist '("\\.ctp$" . nxhtml-mumamo-mode))

(provide 'main-modes)
