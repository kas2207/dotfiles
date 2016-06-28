;; Python mode

(use-package virtualenvwrapper
  :config
  (require 'virtualenvwrapper)
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell)
  (setq venv-location "~/SourceCode/kip-create-api/"))

(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")

(provide 'ks-python)
