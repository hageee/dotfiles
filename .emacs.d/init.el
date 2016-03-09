(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/auto-install")

(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'init-loader)
(init-loader-load "~/.emacs.d/init.d")
(put 'set-goal-column 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(custom-safe-themes
   (quote
    ("5e1d1564b6a2435a2054aa345e81c89539a72c4cad8536cfe02583e0b7d5e2fa" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "nil"))))
 '(fa-face-hint ((t (:background "#3f3f3f" :foreground "#ffffff"))))
 '(fa-face-hint-bold ((t (:background "#3f3f3f" :weight bold))))
 '(fa-face-semi ((t (:background "#3f3f3f" :foreground "#ffffff" :weight bold))))
 '(fa-face-type ((t (:inherit (quote font-lock-type-face) :background "#3f3f3f"))))
 '(fa-face-type-bold ((t (:inherit (quote font-lock-type-face) :background "#999999" :bold t))))
 '(helm-selection ((t (:background "cyan" :distant-foreground "black")))))
