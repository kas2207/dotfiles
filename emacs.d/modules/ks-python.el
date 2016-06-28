;; Python mode

(use-package virtualenvwrapper
  :config
  (require 'virtualenvwrapper)
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell)
  (setq venv-location "~/SourceCode/kip-create-api/"))

(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")

(with-eval-after-load "ks-helm"
  (use-package helm-pydoc
    :config
    (with-eval-after-load "python"
      (define-key python-mode-map (kbd "C-c C-d") 'helm-pydoc))))


(provide 'ks-python)
