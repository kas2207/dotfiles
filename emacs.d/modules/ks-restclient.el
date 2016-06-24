(use-package restclient
  :config
  (with-eval-after-load "ks-helm"
    (use-package restclient-helm))
  (add-to-list 'company-backends 'company-restclient))

(provide 'ks-restclient)
