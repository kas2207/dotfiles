;; Kyle's Emacs Config

(eval-and-compile
  (mapc #'(lambda (path)
            (add-to-list 'load-path
                         (expand-file-name path user-emacs-directory)))
        '("site-lisp" "site-lisp/use-package" "site-lisp/diminish"))
  (defvar use-package-verbose t)
  (require 'use-package))

(require 'bind-key)
(require 'diminish nil t)

(setq custom-file (locate-user-emacs-file "settings.el"))
(load custom-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure Dependencies ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package dash :defer t :load-path "site-lisp/dash")


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure Global Vars ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq sql-mysql-program "/usr/bin/mysql")

;;;;;;;;;;;;;;;;;;;
;; Load Packages ;;
;;;;;;;;;;;;;;;;;;;

(use-package helm-config
  :demand t
  :load-path "site-lisp/helm"
  :bind (("C-c h"   . helm-command-prefix)
         ("M-x"     . helm-M-x)
         ("C-x C-f" . helm-find-files)
	 ("C-h a"   . helm-apropos)
	 ("C-x b"   . helm-mini)
	 ("M-y"     . helm-show-kill-ring)
	 ("C-c h o" . helm-occur)
	 ("C-h SPC" . helm-all-mark-rings)
	 ("C-c h x" . helm-register)
	 ("C-c h g" . helm-google-suggest))
  :init
  (setq helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match t
	helm-semantic-fuzzy-match t
	helm-imenu-fuzzy-match t
	helm-locate-fuzzy-match t
	helm-apropos-fuzzy-match t
	helm-lisp-fuzzy-completion t)
  :config
  (use-package helm-commands)
  (use-package helm-files)
  (use-package helm-buffers)
  (use-package helm-mode
     :diminish helm-mode
     :init
     (helm-mode 1))
  (use-package helm-multi-match)

  (helm-autoresize-mode 1)

  (bind-key "<tab>" #'helm-execute-persistent-action helm-map)
  (bind-key "C-i" #'helm-execute-persistent-action helm-map)
  (bind-key "C-z" #'helm-select-action helm-map)
  (bind-key "C-c C-l" #'helm-minibuffer-history minibuffer-local-map)
  
  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t)))

(use-package magit
  :load-path ("site-lisp/magit/lisp"
	      "site-lisp/with-editor")
  :bind ("C-x g" . magit-status)
  :init (add-hook 'magit-mode-hook 'hl-line-mode)

  :config
  (use-package magit-backup
    :disabled t
    :commands magit-backup-mode
    :config
    (magit-backup-mode -1))
  (use-package magit-commit
    :config
    (remove-hook 'server-switch-hook 'magit-commit-diff))
  (bind-key "U" #'magit-unstage-all magit-mode-map))
