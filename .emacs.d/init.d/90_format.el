(setq-default tab-width 2)

(add-hook 'ruby-mode-hook
    '(lambda ()
         (setq tab-width 2)
         (setq indent-tabs-mode 't)
         (setq ruby-indent-level tab-width)
))
