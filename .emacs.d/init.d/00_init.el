;; スタートアップページを表示しない
(setq inhibit-startup-message t)
;; メニューバー非表示
(setq menu-bar-mode 0)
;; ツールバー非表示
(setq tool-bar-mode 0)

; 言語を日本語にする
(set-language-environment 'Japanese)
; 極力UTF-8とする
(set-terminal-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8)

;ファイルのフルパス表示
(set-default 'mode-line-buffer-identification
           '(buffer-file-name ("%f") ("%b")))

;; tab ではなく space を使う
(setq-default indent-tabs-mode nil)
;; tab 幅を 4 に設定
(setq-default tab-width 4)
;; narrowing を禁止
(put 'narrow-to-region 'disabled nil)

;; 再帰的にgrep
(require 'grep)
(setq grep-command-before-query "grep -nH -r --exclude \"*.log\" -e ")
(defun grep-default-command ()
  (if current-prefix-arg
      (let ((grep-command-before-target
         (concat grep-command-before-query
             (shell-quote-argument (grep-tag-default)))))
    (cons (if buffer-file-name
          (concat grep-command-before-target
              " *."
              (file-name-extension buffer-file-name))
        (concat grep-command-before-target " ."))
          (+ (length grep-command-before-target) 1)))
    (car grep-command)))
(setq grep-command (cons (concat grep-command-before-query " .")
             (+ (length grep-command-before-query) 1)))

;;; 画像ファイルを表示
(auto-image-file-mode t)

;;; evalした結果を全部表示
(setq eval-expression-print-length nil)

;;; 対応する括弧を光らせる。
(show-paren-mode 1)
;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
;(setq show-paren-style 'mixed)

;; 空白や長すぎる行を視覚化する。
(require 'whitespace)

;; 1行が120桁を超えたら長すぎると判断する。
;;(setq whitespace-line-column 120)

(setq whitespace-style '(face  ; faceを使って視覚化する。
             trailing          ; 行末の空白を対象とする。
;             lines-tail        ; 長すぎる行のうち
                               ; whitespace-line-column以降のみを
                               ; 対象とする。
             space-before-tab  ; タブの前にあるスペースを対象とする。
             space-after-tab)) ; タブの後にあるスペースを対象とする。
;; デフォルトで視覚化を有効にする。
(global-whitespace-mode 1)

;;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;;; カーソルの場所を保存する
(require 'saveplace)
(setq-default save-place t)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq next-line-add-newlines nil)

;;; バックアップファイルを作らない
(setq backup-inhibited t)

;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)

;; オートセーブファイルを作らない
(setq auto-save-default nil)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;;; 部分一致の補完機能を使う
;; p-bでprint-bufferとか
;; (PARTIAL-COMPLETION-MODE T)

;;; 履歴数を大きくする
(setq history-length 10000)

;;; ミニバッファの履歴を保存する
(savehist-mode 1)

;;; 最近開いたファイルを保存する数を増やす
(setq recentf-max-saved-items 10000)

;;; ediffを1ウィンドウで実行
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;; diffのオプション
(setq diff-switches '("-u" "-p" "-N"))

;;; diredを便利にする
(require 'dired-x)

;;; diredから"r"でファイル名をインライン編集する
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;; ファイル名が重複していたらディレクトリ名を追加する。
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; ファイルの先頭に#!...があるファイルを保存すると実行権をつける。
(add-hook 'after-save-hook
      'executable-make-buffer-file-executable-if-script-p)

;; ウィンドウの上部に現在の関数名を表示。
(which-function-mode 1)

;; Command-Key and Option-Key
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

; タブ幅指定
(setq tab-width 2
         c-basic-offset 2
         c-hanging-comment-ender-p nil
         indent-tabs-mode nil)

;;; 行の折り返しをしない
(setq truncate-lines t)
(setq truncate-partial-width-windows t)

;;通常のウィンドウ用の設定
(setq-default truncate-lines t)
;;ウィンドウを左右に分割したとき用の設定
(setq-default truncate-partial-width-windows t)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; imenu index自動更新
(setq imenu-auto-rescan t)
