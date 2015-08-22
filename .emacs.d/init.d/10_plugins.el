(require 'flymake)
;; GUIの警告は表示しない
(setq flymake-gui-warnings-enabled nil)
;; 全てのファイルで flymakeを有効化
(add-hook 'find-file-hook 'flymake-find-file-hook)
;; M-p/M-n で警告/エラー行の移動
(global-set-key "\M-p" 'flymake-goto-prev-error)
(global-set-key "\M-n" 'flymake-goto-next-error)
;; 警告エラー行の表示
(global-set-key "\C-c d" 'flymake-display-err-menu-for-current-line)

;; Emacs Nav
(require 'nav)
(nav-disable-overeager-window-splitting)
;; Optional: set up a quick key to toggle nav
(global-set-key [f8] 'nav-toggle)

(require 'auto-complete-config)
(ac-config-default)

;; GNU global(gtags)の設定
(when (locate-library "gtags") (require 'gtags))
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)
         ))

;; ;; Helm
;; (require 'helm-config)
;; (require 'helm-command)
;; (require 'helm-descbinds)
;; (require 'helm-themes)

;; (setq helm-idle-delay             0.3
;;       helm-input-idle-delay       0.3
;;       helm-candidate-number-limit 200)

;; ;;(global-set-key (kbd "M-a")   'helm-for-files)
;; (global-set-key (kbd "C-^")   'helm-c-apropos)
;; (global-set-key (kbd "C-r")   'helm-resume)
;; (global-set-key (kbd "M-s")   'helm-occur)
;; (global-set-key (kbd "M-x")   'helm-M-x)
;; (global-set-key (kbd "M-y")   'helm-show-kill-ring)
;; (global-set-key (kbd "C-c k") 'helm-descbinds)

;; Anything
(require 'anything-startup)
(setq anything-c-filelist-file-name "~/all.filelist")
(setq anything-grep-candidates-fast-directory-regexp "^/tmp")
(global-set-key (kbd "M-a")   'anything-filelist+)

;; magit
(require 'magit)

;; grep-edit
(require 'grep)
(require 'grep-edit)

;; unitabify
(require 'untabify-file)
