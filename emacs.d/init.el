;; Kyle's Emacs Config


;; Initialize the package system first of all
(package-initialize)

;; Skip the default splash screen
(setq inhibit-startup-message t)

;; Figure out the path to our .emacs.d by getting the path part of the
;; current file (`init.el`).
(setq dotfiles-dir (file-name-directory
            (or (buffer-file-name) (file-chase-links load-file-name))))

;; Lisp library packages
(add-to-list 'load-path (concat dotfiles-dir "lisp"))

;; Modules
(add-to-list 'load-path (concat dotfiles-dir "modules"))


(setq custom-file (concat dotfiles-dir "ks-custom.el"))
(load custom-file 'noerror)

;; Load the Lisp Emacs fundamentals.
(require 'ks-wm)
(require 'ks-em)
(require 'ks-lib)
(require 'ks-package)

(ks/load-modules)

;; Load executables
(executable-find "mysql")
