
;; Zenburn theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-twilight)

;; Save place in files between sessions
(require 'saveplace)
(setq-default save-place t)

;; Save a list of recent files visited
(require 'recentf)
(recentf-mode 1)

;; ido-mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-max-prospects 7)

;; No annoying startup message
(setq inhibit-startup-message t)

;; Transparently open compressed files
(auto-compression-mode t)

;; We hates tabs
(setq-default indent-tabs-mode nil)

;; UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Disable bell
(setq-default ring-bell-function 'ignore)

;; Nice copy/paste between X and Emacs
(setq-default x-select-enable-primary nil
	      x-select-enable-clipboard t)

;; Default to unified diffs
(setq-default diff-switches "-u")

;; Easier prompts
(defalias 'yes-or-no-p 'y-or-n-p)

(when (eq system-type 'darwin)
  (set-default-font "-*-Monaco-*-160-*"))

(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))

(provide 'main-config)
