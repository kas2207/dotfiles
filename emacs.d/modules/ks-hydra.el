(use-package winner
  :init
  (winner-mode))

(use-package hydra
  :config
  (defhydra hydra-zoom (global-map "<f2>")
    "zoom"
    ("i" text-scale-increase "in")
    ("o" text-scale-decrease "out"))

  (global-set-key (kbd "C-,")
                  (defhydra hydra-vi (:pre (set-cursor-color "#40e0d0")
                                           :post (set-cursor-color "#ffffff"))
                    ("l" forward-char)
                    ("h" backward-char)
                    ("j" next-line)
                    ("k" previous-line)
                    ("q" nil "quit")))
  (global-set-key (kbd "C-.")
                  (defhydra hydra-window-stuff (:hint nil)
                                "
          Split: _v_ert  _s_:horz
         Delete: _c_lose  _o_nly
  Switch Window: _h_:left  _j_:down  _k_:up  _l_:right
        Buffers: _p_revious  _n_ext  _b_:select  _f_ind-file  _F_projectile
         Winner: _u_ndo  _r_edo
         Resize: _H_:splitter left  _J_:splitter down  _K_:splitter up  _L_:splitter right
           Move: _a_:up  _z_:down  _i_menu"


                                ("z" scroll-up-line)
                                ("a" scroll-down-line)
                                ("i" helm-imenu)

                                ("u" winner-undo)
                                ("r" winner-redo)

                                ("h" windmove-left)
                                ("j" windmove-down)
                                ("k" windmove-up)
                                ("l" windmove-right)

                                ("p" previous-buffer)
                                ("n" next-buffer)
                                ("b" ido-switch-buffer)
                                ("f" helm-find-files)
                                ("F" helm-projectile)

                                ("s" split-window-below)
                                ("v" split-window-right)

                                ("c" delete-window)
                                ("o" delete-other-windows)

                                ("H" hydra-move-splitter-left)
                                ("J" hydra-move-splitter-down)
                                ("K" hydra-move-splitter-up)
                                ("L" hydra-move-splitter-right)

                                ("q" nil))))
