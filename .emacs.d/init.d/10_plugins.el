;; Emacs Nav
(require 'nav)
(nav-disable-overeager-window-splitting)
;; Optional: set up a quick key to toggle nav
(global-set-key [f8] 'nav-toggle)

(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

;; ggtags
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))
;; use helm
(setq ggtags-completing-read-function nil)

;; use eldoc
(setq-local eldoc-documentation-function #'ggtags-eldoc-function)

;; imenu
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

(define-key ggtags-mode-map (kbd "M-s") 'ggtags-find-tag-regexp)
(define-key ggtags-mode-map (kbd "M-r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "M-f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
(define-key ggtags-mode-map (kbd "M-p") 'pop-tag-mark)

;;projectile
(require  'projectile)
(projectile-global-mode)

;; windows indexing 高速化のおまじない.
(setq projectile-indexing-method 'alien)

;; 大きいプロジェクトだと劇的に速度が改善するらしい.
(setq projectile-enable-caching t)

;; (when (executable-find "gtags")
;;   (setq projectile-tags-file-name "GTAGS")
;;   (setq projectile-tags-command "gtags"))

(setq projectile-completion-system 'helm)

;; magit
(require 'magit)

;; grep-edit
(require 'grep)
(require 'grep-edit)
