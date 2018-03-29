;; Mac
(require 'cask "/usr/local/opt/cask/cask.el")
;; Linux
;; (require 'cask "~/.cask/cask.el")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(cask-initialize)
;; ---------------
;; Global settings
;; ---------------

;; Disable Backups
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)

;; Menu bar mode
(menu-bar-mode 0)

;; Disable startup message
(setq inhibit-startup-message t)

;; Key-binds
(cua-mode t)
(setq cua-enable-cua-keys nil)
(define-key global-map "\C-xy" 'cua-set-rectangle-mark)
(define-key global-map "\C-h" 'delete-backward-char)
(define-key global-map "\C-r" 'scroll-down)
(define-key global-map "\C-x:" 'goto-line)
(define-key global-map "\C-xt" 'eshell)
(define-key global-map "\C-xg" 'ripgrep-regexp)

;; tab
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; editorconfig
(setq edconf-exec-path "/usr/local/bin/editorconfig")

;; linum
(require 'linum)
(global-linum-mode)

;; hlinum
(require 'hlinum)
(hlinum-activate)

;; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;; anzu
(require 'anzu)
(global-anzu-mode t)

;; company
(require 'company)
(global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)
(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-h") nil)
(set-face-attribute 'company-tooltip nil
                    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common nil
                    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common-selection nil
                    :foreground "white" :background "steelblue")
(set-face-attribute 'company-tooltip-selection nil
                    :foreground "black" :background "steelblue")
(set-face-attribute 'company-preview-common nil
                    :background nil :foreground "lightgrey" :underline t)
(set-face-attribute 'company-scrollbar-fg nil
                    :background "orange")
(set-face-attribute 'company-scrollbar-bg nil
                    :background "gray40")

;; markdown-mode
(require 'markdown-mode)

;; wdired
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; smartparens
;; (require 'smartparens)
;; (add-hook 'ruby-mode-hook #'smartparens-mode)
;; (add-hook 'crystal-mode-hook #'smartparens-mode)
;; (sp-local-pair 'crystal-mode "%" "%" :trigger "%")
;; (autoload 'crystal-mode "crystal-mode" "Major mode for crystal files" t)
;;    (add-to-list 'auto-mode-alist '("\\.cr$" . crystal-mode))
;;    (add-to-list 'interpreter-mode-alist '("crystal" . crystal-mode))

;; ivy/swiper
(require 'ivy)
(require 'counsel)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-height 30)
;; (setq ivy-extra-directories nil)
(setq ivy-re-builders-alist
      '((t . ivy--regex-plus)))
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (defvar counsel-find-file-ignore-regexp (regexp-opt '("./" "../")))
(global-set-key "\C-s" 'swiper)
(defvar swiper-include-line-number-in-search t)

;; web-mode
(require 'web-mode)
(add-hook 'web-mode-hook 'web-mode-hook)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ecr\\'" . web-mode))
(add-to-list 'auto-mode-alist '(".*\\.vue\\'" . web-mode))
(defun web-mode-indent (num)
  (interactive "nIndent: ")
  (setq web-mode-markup-indent-offset num)
  (setq web-mode-css-indent-offset num)
  (setq web-mode-style-padding num)
  (setq web-mode-code-indent-offset num)
  (setq web-mode-script-padding num)
  (setq web-mode-block-padding num)
  )
;; web-mode-enableの設定項目
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-column-highlight t)
;; web-mode-indentでインタラクティブに設定変更可能
(web-mode-indent 2)
;; web-modeのautocompleteが異常に重いので停止
(setq web-mode-disable-autocompletion t)
 
;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-x n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-x p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-x C-m") 'mc/mark-all-like-this)

;; -------------------------------------
;; Settings for each programing language
;; -------------------------------------

;; Ruby
;; Disable encoding magic comment
(setq ruby-insert-encoding-magic-comment nil)
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Fastfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Dangerfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Dangerfile.hosted$" . ruby-mode))
(add-to-list 'auto-mode-alist '("[Rr]akefile$" . ruby-mode))

;; gem install pry pry-doc method_source
;; Ruby用補完
(autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
(autoload 'robe-ac-setup "robe-ac" "robe auto-complete" nil nil)
(add-hook 'robe-mode-hook 'ac-robe-setup)

;; Rust
;; -- 事前準備 --
;; srcのダウンロード
;; > rustup component add rust-src
;; racerのダウンロード
;; > cargo install racer
;; racerやrustfmt、コンパイラにパスを通す
;; パッケージのアップデート
;; > cargo install cargo-update
;; > cargo install-update -a
(add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))
;; rust-modeでrust-format-on-saveをtにすると自動でrustfmtが走る
(eval-after-load "rust-mode"
  '(setq-default rust-format-on-save t))
;; rustのファイルを編集するときにracerとflycheckを起動する
(add-hook 'rust-mode-hook (lambda ()
                            (racer-mode)
                            (flycheck-rust-setup)))
;; racerのeldocサポートを使う
(add-hook 'racer-mode-hook #'eldoc-mode)
;; racerの補完サポートを使う
(add-hook 'racer-mode-hook (lambda ()
                             (company-mode)
                             (set (make-variable-buffer-local 'company-idle-delay) 0.1)
                             (set (make-variable-buffer-local 'company-minimum-prefix-length) 3)))

;; React
;; .jsは全てrjsx-modeで読み込む
;; (add-to-list 'auto-mode-alist '(".*\\.js\\'" . rjsx-mode))

;; Groovy
(if (and (= emacs-major-version 24) (< emacs-minor-version 5))
    (require 'cl))

;; js
(setq js-indent-level 2)
