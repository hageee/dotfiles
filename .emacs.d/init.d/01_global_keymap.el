;;; キーバインド --- キーバインド
;;; Commentary:

;;; Code:
(define-key global-map (kbd "M-?") 'help-for-help)        ; ヘルプ
(define-key global-map (kbd "C-z") 'undo)                 ; undo
(define-key global-map (kbd "C-c i") 'indent-region)      ; インデント
(define-key global-map (kbd "C-c C-i") 'hippie-expand)    ; 補完
(define-key global-map (kbd "C-c C-c") 'comment-or-uncomment-region) ; コメントアウト
(define-key global-map (kbd "C-c l") 'goto-line)          ; 指定行へ移動
(define-key global-map (kbd "C-x g") 'grep)               ; grep
(define-key global-map (kbd "C-c f") 'find-dired)         ; find-dired
(global-set-key (kbd "C-M-l") 'shrink-window-horizontally)
(global-set-key (kbd "C-M-r") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-d") 'shrink-window)
(global-set-key (kbd "C-M-u") 'enlarge-window)

;; C-c nで行番号表示
(define-key global-map (kbd "C-c n") 'linum-mode)

;; ウィンドウ移動
;; 次のウィンドウへ移動
(define-key global-map (kbd "C-M-n") 'next-multiframe-window)
;; 前のウィンドウへ移動
(define-key global-map (kbd "C-M-p") 'previous-multiframe-window)

(define-key global-map (kbd "C-c i")   'imenu)

;; Invoke Helm
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)
(define-key global-map (kbd "M-r")     'helm-resume)
(define-key global-map (kbd "C-M-h")   'helm-apropos)
(define-key global-map (kbd "M-a")   'helm-for-files)

;; Magit
(define-key global-map (kbd "M-g")     'magit-status)

;;; 01_global_keymap.el ends here
