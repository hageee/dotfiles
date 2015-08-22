;; ruby-mode
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist)
)
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")

;; ruby-electric
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; ruby-block
(require 'ruby-block)
(add-hook 'ruby-mode-hook '(lambda () (ruby-block-mode t)))

;; ミニバッファに表示し, かつ, オーバレイする.
(setq ruby-block-highlight-toggle t)

;; Flymake
(add-hook 'ruby-mode-hook '(lambda () (flymake-ruby-load)))

;; キーバインド
(add-hook 'ruby-mode-hook
          '(lambda ()
             ;; 次のウィンドウへ移動
             (define-key ruby-mode-map (kbd "C-M-n") 'next-multiframe-window)
             ;; 前のウィンドウへ移動
             (define-key ruby-mode-map (kbd "C-M-p") 'previous-multiframe-window)
             (define-key ruby-mode-map "\M-t" 'find-tag)
             (define-key ruby-mode-map "\M-r" 'find-tag-regexp)
             (define-key ruby-mode-map "\M-s" 'anything-c-etags-select)
             (define-key ruby-mode-map "\C-t" 'pop-tag-mark)))

;; インデント
(add-hook 'ruby-mode-hook
    '(lambda ()
         (setq tab-width 2)
         (setq indent-tabs-mode nil)
         (setq ruby-indent-level tab-width)
     )
)
