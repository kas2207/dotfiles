;;; ks-package.el --- Package system configuration

;; `(online?)` is a function that tries to detect whether you are online.
;; We want to refresh our package list on Emacs start if we are.

(require 'cl)
(defun online? ()
  (if (and (functionp 'network-interface-list)
	   (network-interface-list))
      (some (lambda (iface) (unless (equal "lo" (car iface))
			      (member 'up (first (last (network-interface-info
							 (car iface)))))))
	    (network-interface-list))
    t))

;; Package Manager
(setq package-user-dir (concat dotfiles-dir "elpa"))
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org"   . "http://orgmode.org/elpa/") t)

;; Get the package manager going
(package-initialize)

;; Only fetch packages when we are online
(when (online?)
  (unless package-archive-contents (package-refresh-contents)))

;; `Paradox` - enhanced interface for package management
(when (not (package-installed-p 'paradox))
  (package-install 'paradox))

(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Load Modules
(setq ks/available-modules
      '(ks-helm
	ks-ido
	ks-magit
	ks-org
	ks-snippets))

(defun ks/load-modules ()
  (interactive)
  (dolist (module ks/available-modules) (require module nil t)))

(provide 'ks-package)
