(set-face-background 'anything-grep-match "#5f5f00")
(set-face-background 'anything-match "#5f5f00")
(set-face-background 'match "#5f5f00")

;; 行カーソル
(defface hlline-face
  '((((class color)
      (background dark))
     (:background nil
                  :underline "#ffffff"))
    (((class color)
      (background light))
     (:background nil
                  :underline "#ffffff"))
    (t ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)
