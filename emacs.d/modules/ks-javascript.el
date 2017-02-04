(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js?\\'"   . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'"  . web-mode))
  (setq web-mode-content-types '(("jsx" . "\\.js[x]?\\'"))))

(provide 'ks-javascript)
