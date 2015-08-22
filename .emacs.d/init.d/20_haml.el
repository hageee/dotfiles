;;haml-mode
(require 'haml-mode nil 't)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.hamlc$" . haml-mode))
;; Flymake
(add-hook 'haml-mode-hook '(lambda () (flymake-haml-load)))
