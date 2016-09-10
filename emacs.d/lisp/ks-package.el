;;; ks-package.el --- Package system configuration

;; Load Modules
(setq ks/available-modules
      '(ks-appearance
        ks-complete
        ks-counsel
        ks-dired
        ks-docker
        ks-dot
        ks-editing
        ks-eshell
        ks-flycheck
        ks-helm
        ks-help
        ks-html
        ks-ido
        ;;ks-ivy
        ks-java
        ks-json
        ks-magit
        ks-markdown
        ks-mode-line
        ks-navigation
        ks-org
        ks-project
        ks-python
        ks-restclient
        ks-snippets
        ks-whitespace
        ks-yaml))

(defun ks/load-modules ()
  (interactive)
  (dolist (module ks/available-modules) (require module nil t)))

(provide 'ks-package)
