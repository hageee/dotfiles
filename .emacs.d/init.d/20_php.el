; PHPモード
(load-library "php-mode")
(require 'php-mode)
(add-hook 'php-mode-user-hook
'(lambda ()
   (setq tab-width 4)
   (setq indent-tabs-mode nil))
)
(add-hook 'php-mode-hook (lambda () (gtags-mode 1)))
