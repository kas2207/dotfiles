(use-package projectile
  :demand t
  :commands projectile-global-mode
  :config
  (projectile-global-mode)
  :bind ("C-c C-f" . projectile-find-file)
  :diminish projectile-mode)

(provide 'ks-project)
