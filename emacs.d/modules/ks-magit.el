(use-package magit
  :bind ("C-x g" . magit-status)
  :init (add-hook 'magit-mode-hook 'hl-line-mode))

(provide 'ks-magit)
