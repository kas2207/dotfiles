;; Kyle's Emacs Config

(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
      ("melpa" . "https://melpa.org/packages/")
      ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
      ("elpy" . "https://jorgenschaefer.github.io/packages/")))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (package '(auto-complete
                   better-defaults
                   cider
                   clojure-mode
                   elm-mode
                   elpy
                   flycheck
                   haskell-mode
                   helm
                   helm-projectile
                   markdown-mode
                   paredit
                   py-autopep8
                   racket-mode
                   ))
  (unless (package-installed-p package)
    (package-install package)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Global Settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Color Configurations
(add-to-list 'default-frame-alist '(foreground-color . "LawnGreen"))
(add-to-list 'default-frame-alist '(background-color . "black"))
(add-to-list 'default-frame-alist '(cursor-color . "tomato"))

;; Enable Line and Column Numbering
(line-number-mode 1)
(column-number-mode 1)

;; Global Line Numbers
(global-linum-mode t)

;; Turn on font-locking globally
(global-font-lock-mode t)

;; Unify the emacs kill ring and the clipboad
(setq x-select-enable-clipboard t)

;; Don't allow automatic tab inserts
(setq-default indent-tabs-mode nil)

;; Enable line highlighting
(global-hl-line-mode 1)

;; Cursor-style setting functions
(defun set-cursor-type (cursor)
  "Modify the cursor to the specified type"
  (interactive "sCursor type (bar, box, etc.): ")
  (modify-frame-parameters
   (selected-frame)
   (list (cons 'cursor-type (intern cursor)))))

(defun set-bar-cursor ()
  "Change the cursor to a bar rather than the (default) box"
  (interactive)
  (set-cursor-type "bar"))

(defun set-box-cursor ()
  "Change the cursor to a box (the default style)"
  (interactive)
  (set-cursor-type "box"))

(set-bar-cursor)

;; Single space ends a sentence
(setq sentence-end-double-space nil)

;; Stop blinking cursor
(blink-cursor-mode 0)

;; Turn off the menu and tool bar
(menu-bar-mode -1)

(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))

;; Default text mode
(setq default-major-mode 'text-mode)

;; Display time and date
(setq display-time-day-and-date 'true)

;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes nil)
 '(org-agenda-files (quote ("~/Documents/Notes/Journal/2016-03-04.org")))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25)
 '(transient-mark-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-indentation-current-column-face ((t nil)))
 '(highlight-indentation-face ((t nil))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Whitespace cleanup and display
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Detabify
(defun detabify-buffer ()
  "Calls untabify on the current buffer"
  (interactive)
  (untabify (point-min) (point-max)))

;; Whitespace
(defun clean-up-whitespace ()
  "Calls detabify-buffer and delete-trailing-whitespace on the current buffer."
  (interactive)
  (detabify-buffer)
  (delete-trailing-whitespace))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Package Configurations
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Auto Complete
(require 'auto-complete)
(global-auto-complete-mode t)

;; Clojure-Mode
(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljc$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.dtm$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))

(add-hook 'clojure-mode-hook #'paredit-mode)

;; Elm-mode
(require 'elm-mode)


;; Org-mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-iswitchb)


;;Paredit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook #'enable-paredit-mode)

(require 'eldoc)
(eldoc-add-command
 'paredit-backward-delete
 'paredit-close-around)

(defvar electrify-return-match
  "[\]}\)\"]"
  "If this regexp matches the text after the cursor, do an \"electric\"
  return.")

(defun electrify-return-if-match
  (arg)
  "If the text after the cursor matches `electrify-return-match then open and indent
an empty line between the cursor and the text. Move the cursor to the new line."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
        (save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))

(global-set-key (kbd "RET") 'electrify-return-if-match)

;;Python
(elpy-enable)
(elpy-use-ipython)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;; Helm
(require 'helm)
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match t)
(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
(setq helm-locate-fuzzy-match t)
(global-set-key (kbd "C-c h o") 'helm-occur)
(setq helm-apropos-fuzzy-match t)
(setq helm-lisp-fuzzy-completion t)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c h x") 'helm-register)
(global-set-key (kbd "C-c h g") 'helm-google-suggest)
(global-set-key (kbd "C-c h M-:") 'helm-eval-expression-with-eldoc)

(require 'helm-eshell)
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)))
(define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t)
(helm-mode 1)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-switch-project-action 'helm-projectile)

;; Org Mode
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t))))
