
;; Color theme
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-light)

;; Use new deftheme facility
(load-theme 'tomorrow-night t)

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
(setq ido-default-buffer-method 'selected-window)

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

;; 2-space indent for Coffeescript
(setq coffee-tab-width 2)

;; Easier prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;(when (eq system-type 'darwin)
;  (set-default-font "-*-Monaco-*-160-*"))
(when (eq system-type 'darwin)
  (global-set-key [f6] 'ns-toggle-fullscreen))

;; Enable directory local variables with remote files. This facilitates both
;; the (dir-locals-set-class-variables ...)(dir-locals-set-directory-class ...)
;; and the dir-locals.el approaches.
(defadvice hack-dir-local-variables (around my-remote-dir-local-variables)
  "Allow directory local variables with remote files, by temporarily redefining
     `file-remote-p' to return nil unconditionally."
  (flet ((file-remote-p (&rest) nil))
    ad-do-it))
(ad-activate 'hack-dir-local-variables)

;; Allow proper JSX handling for React JS files
(setq web-mode-content-types-alist '(("jsx"  . "\\.js[x]?\\'")))

(provide 'main-config)
