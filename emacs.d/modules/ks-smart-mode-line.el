(use-package rich-minority
  :commands rich-minority-mode
  :demand t
  :init
  (setq rm-blacklist '(" Helm" " Guide" " $" " ," " Tern" " Ind" " alchemist"
                       " Monroe" " cljr" " Wrap" " Doc"))
  :config
  (rich-minority-mode 1))

(use-package "smart-mode-line"
  :commands sml/setup
  :demand t
  :init
  (setq sml/theme 'light
        sml/shorten-directory t
        sml/shorten-modes t
        sml/name-width 40
        sml/mode-width 'full)
  :config
  (sml/setup))

(provide 'ks-smart-mode-line)
