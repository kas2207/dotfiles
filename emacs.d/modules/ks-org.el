(use-package org
  :ensure org-plus-contrib
  :init (setq org-agenda-files
	      (delq nil
		    (mapcar (lambda (x) (and (file-exists-p x) x))
			    '("~/Dropbox/Org-Files/personal.org"
			      "~/Dropbox/Org-Files/business.org"))))
  :bind (("C-c l" . org-store-link)
	 ("C-c a" . org-agenda)
	 ("C-c c" . org-capture)
	 ("C-c b" . org-iswitchb))
  :config
  (add-hook
   'org-mode-hook
   (lambda ()
     (visual-line-mode 1)))
  (use-package org-bullets
    :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))))

(provide 'ks-org)
