;;; setup-elpa.el --- Install a base set of packages automatically.
;;
;; Derived from the Emacs Starter Kit

(require 'cl)

(defvar setup-packages (list 'css-mode
			     'gist
			     'idle-highlight
			     'magit
			     'yaml-mode
			     'yasnippet-bundle)
  "Libraries that should be installed by default.")

(defun setup-elpa-install ()
  "Install all setup packages that aren't installed."
  (interactive)
  (dolist (package setup-packages)
    (unless (or (member package package-activated-list)
                (functionp package))
      (message "Installing %s" (symbol-name package))
      (package-install package))))

(defun esk-online? ()
  "See if we're online.

Windows does not have the network-interface-list function, so we
just have to assume it's online."
  ;; TODO how could this work on Windows?
  (if (and (functionp 'network-interface-list)
           (network-interface-list))
      (some (lambda (iface) (unless (equal "lo" (car iface))
                         (member 'up (first (last (network-interface-info
                                                   (car iface)))))))
            (network-interface-list))
    t))

;; On your first run, this should pull in all the base packages.
(when (esk-online?)
  (unless package-archive-contents (package-refresh-contents))
  (setup-elpa-install))

(provide 'setup-elpa)
