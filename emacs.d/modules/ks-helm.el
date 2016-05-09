(use-package helm
  :config
  (require 'helm-config)
  (require 'helm)
  (helm-mode 1)
  (helm-autoresize-mode 1)
  (bind-key "<tab>" #'helm-execute-persistent-action helm-map)
  (bind-key "C-i" #'helm-execute-persistent-action helm-map)
  (bind-key "C-z" #'helm-select-action helm-map)
  (bind-key "C-c C-l" #'helm-minibuffer-history minibuffer-local-map)
  :bind (("C-x C-f" . helm-find-files)
	 ("C-h a"   . helm-apropos)
	 ("C-x b"   . helm-mini)
	 ("M-y"     . helm-show-kill-ring)
	 ("C-c h o" . helm-occur)
	 ("C-h SPC" . helm-all-mark-rings)
	 ("C-c h x" . helm-register)
	 ("C-c h g" . helm-google-suggest))
  :diminish helm-mode
  :init
  (setq helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match t
	helm-semantic-fuzzy-match t
	helm-imenu-fuzzy-match t
	helm-locate-fuzzy-match t
	helm-apropos-fuzzy-match t
	helm-lisp-fuzzy-completion t)
  
  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t)))



(provide 'ks-helm)
