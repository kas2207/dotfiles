;; Enable Ido-mode
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-url-at-point t
      ido-max-prospects 10
      ido-use-virtual-buffers t)

(use-package ido-ubiquitous
  :config
  (ido-ubiquitous-mode))


(use-package smex
  :config
  (smex-initialize)
  :bind (("M-x" . smex)
	 ("M-X" . smex-major-mode-commands)))

(use-package ido-vertical-mode
  :config
  (ido-vertical-mode))

(use-package flx-ido
  :config
  (flx-ido-mode 1)
  (setq ido-enable-flex-matching t
	ido-use-faces nil
	gs-cons-threshold 20000000))


(provide 'ks-ido)
