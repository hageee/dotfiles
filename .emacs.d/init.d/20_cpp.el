(require 'cc-mode)

;; c-mode-common-hook は C/C++ の設定

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq c-default-style "k&r") ;; カーニハン・リッチースタイル
            (setq indent-tabs-mode nil)  ;; タブは利用しない
            (setq c-basic-offset 4)
            ))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))

(defun get-project-include-directories()
  (append (mapcar (lambda (p) (concat (projectile-project-root) p)) '("include"))
          (list "/path/to/include")
          )
  )

(require 'flycheck)
(add-hook 'c-mode-common-hook 'flycheck-mode)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-include-path (get-project-include-directories))))
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-include-path (get-project-include-directories))))

;;(setq-default flycheck-disabled-checkers '(c/c++-clang))

(require 'srefactor)
(define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)

(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (setq achead:get-include-directories-function (lambda () (append (achead:get-include-directories) (get-project-include-directories))))
  (add-to-list 'ac-sources 'ac-source-c-headers))

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

;; TODO install clang-complete
;; https://github.com/Golevka/emacs-clang-complete-async
;;(require 'auto-complete-clang-async)
;; (defun ac-cc-mode-setup ()
;;   (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
;;   (setq ac-sources (append ac-sources '(ac-source-clang-async)))
;;   (ac-clang-launch-completion-process))

;; (defun my-ac-config ()
;;   (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;   (global-auto-complete-mode t))
;; (my-ac-config)

(define-key c-mode-map (kbd "C-M-o") 'ff-find-other-file)
(define-key c++-mode-map (kbd "C-M-o") 'ff-find-other-file)

(custom-set-faces
 '(fa-face-hint ((t (:background "#3f3f3f" :foreground "#ffffff"))))
 '(fa-face-hint-bold ((t (:background "#3f3f3f" :weight bold))))
 '(fa-face-semi ((t (:background "#3f3f3f" :foreground "#ffffff" :weight bold))))
 '(fa-face-type ((t (:inherit (quote font-lock-type-face) :background "#3f3f3f"))))
 '(fa-face-type-bold ((t (:inherit (quote font-lock-type-face) :background "#999999" :bold t)))))

;;
