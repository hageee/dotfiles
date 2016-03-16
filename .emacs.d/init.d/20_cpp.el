(require 'cc-mode)

;; c-mode-common-hook は C/C++ の設定

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq c-default-style "k&r") ;; カーニハン・リッチースタイル
            (setq indent-tabs-mode t)  ;; インデントはTAB
            (setq c-basic-offset 4)
            (setq tab-width 4)
            )
          )

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))

;; Additional include directories
;(defun get-project-include-directories()
;  (append (mapcar (lambda (p) (concat (projectile-project-root) p)) '("include" "src"))
;          (list "/path/to/include")
;          )
;  )

(require 'flycheck)
(add-hook 'c-mode-common-hook 'flycheck-mode)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-include-path (get-project-include-directories))))
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-include-path (get-project-include-directories))))

;;(setq-default flycheck-disabled-checkers '(c/c++-clang))

(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (setq achead:get-include-directories-function (lambda () (append (achead:get-include-directories) (get-project-include-directories))))
  (add-to-list 'ac-sources 'ac-source-c-headers))

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

;; (require 'auto-complete-clang-async)
;; (defun ac-cc-mode-setup ()
;;   (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
;;   (setq ac-sources (append ac-sources '(ac-source-clang-async)))
;;   (ac-clang-launch-completion-process))

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(my-ac-config)

(define-key c-mode-map (kbd "C-M-o") 'ff-find-other-file)
(define-key c++-mode-map (kbd "C-M-o") 'ff-find-other-file)

;; semantic-create-imenu-indexは
;; No items suitable for an index found in this buffer
;; になるため常にデフォルトを使う
(add-hook 'c++-mode-hook (lambda () (imenu-force-default-create-function)))
(add-hook 'c-mode-hook (lambda () (imenu-force-default-create-function)))

(defun imenu-force-default-create-function()
  (interactive)
  (setq imenu-create-index-function 'imenu-default-create-index-function)
  )

(define-key c-mode-map (kbd "C-c s") 'imenu-force-default-create-function)
(define-key c++-mode-map (kbd "C-c s") 'imenu-force-default-create-function)

;;
