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
	 ("C-c h g" . helm-google-suggest)
	 :map minibuffer-local-map
	 ("C-c C-l"    . helm-minibuffer-history))
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

  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t)))
;; ;;;; Turn off mouse interface early in startup to avoid momentary display
;; (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; ;; Turn off welcome screen
;; (setq inhibit-startup-message t)

;; ;; Unicode FTW
;; (setq locale-coding-system 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-selection-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8)
;; (set-language-environment "UTF-8")
;; (setq current-language-environment "UTF-8")

;; ;; Move back-ups to temp directory
;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms
;;       `((".*" ,temporary-file-directory t)))

;; ;;;;;;;;;;;;;;;;;;;;;
;; ;; Global Settings ;;
;; ;;;;;;;;;;;;;;;;;;;;;

;; ;; Enable Line and Column Numbering
;; (line-number-mode 1)
;; (column-number-mode 1)

;; ;; Global Line Numbers
;; (global-linum-mode t)

;; ;; Turn on font-locking globally
;; (global-font-lock-mode t)

;; ;; Unify the emacs kill ring and the clipboad
;; (setq x-select-enable-clipboard t)

;; ;; Don't allow automatic tab inserts
;; (setq-default indent-tabs-mode nil)

;; ;; Enable line highlighting
;; (global-hl-line-mode 1)

;; ;; Cursor-style setting functions
;; (defun set-cursor-type (cursor)
;;   "Modify the cursor to the specified type"
;;   (interactive "Cursor type (bar, box, etc.): ")
;;   (modify-frame-parameters
;;    (selected-frame)
;;    (list (cons 'cursor-type (intern cursor)))))

;; (defun set-bar-cursor ()
;;   "Change the cursor to a bar rather than the (default) box"
;;   (interactive)
;;   (set-cursor-type "bar"))

;; (defun set-box-cursor ()
;;   "Change the cursor to a box (the default style)"
;;   (interactive)
;;   (set-cursor-type "box"))

;; (set-bar-cursor)

;; ;; Stop blinking cursor
;; (blink-cursor-mode 0)

;; ;; Default text mode
;; (setq default-major-mode 'org-mode)
