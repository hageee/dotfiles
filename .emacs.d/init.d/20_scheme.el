;;; Scheme --- Settings fot Scheme
;;; Commentary:

;;; Code:

;; UTF-8 に統一
(setq process-coding-system-alist
      (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))

(setq scheme-program-name "gosh -i")
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

;; 別のウィンドウに gosh を動作させる
(defun scheme-other-window ()
  "Run Gauche on other window."
  (interactive)
  (split-window-horizontally (/ (frame-width) 2))
  (let ((buf-name (buffer-name (current-buffer))))
    (scheme-mode)
    (switch-to-buffer-other-window
     (get-buffer-create "*scheme*"))
    (run-scheme scheme-program-name)
    (switch-to-buffer-other-window
     (get-buffer-create buf-name))))

(define-key global-map "\C-c S" 'scheme-other-window)

(defun my:scheme-init()
  (require 'smartparens-config)
  (smartparens-global-mode t)
  (require 'rainbow-delimiters)
)

(add-hook 'scheme-mode-hook 'my:scheme-init)
(add-hook 'lisp-mode-hook 'my:scheme-init)

;; these setting should be placed after load-theme
;; using stronger colors
(require 'cl-lib)
(require 'color)

;; 関数にしないとうまくいかない...手動で有効に
(defun rainbow-delimiters-using-stronger-colors ()
  (interactive)
  (cl-loop
   for index from 1 to rainbow-delimiters-max-face-count
   do
   (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
     (cl-callf color-saturate-name (face-foreground face) 100))))

;; making unmatched parens stand out more
(set-face-attribute 'rainbow-delimiters-unmatched-face nil
                    :foreground 'unspecified
                    :inherit 'error
                    :strike-through t)

;;; 20_scheme.el ends here
