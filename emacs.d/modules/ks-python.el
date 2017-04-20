;; Python mode
(require 'ks-lib)


(use-package virtualenvwrapper
  :config
  (require 'virtualenvwrapper)
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell)
  (let ((virtual-env "~/SourceCode/virtualenvs/"))
    (ks/create-directory virtual-env)
    (setq venv-location virtual-env)))

(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")

(add-hook 'python-mode-hook (lambda ()
                              (semantic-mode 1)
                              (setq flycheck-checker 'python-pylin
                                    flycheck-checker-error-threshold 900
                                    flycheck-pylintrc "~/.pylintrc")))

(provide 'ks-python)
