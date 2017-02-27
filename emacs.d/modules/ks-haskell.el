(use-package haskell-mode)

(use-package flycheck-haskell
  :config
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup)))
