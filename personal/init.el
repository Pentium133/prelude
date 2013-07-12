
(prelude-ensure-module-deps '(dash magit ruby-end company tree-mode))

(load-library "workspaces.el")
(global-set-key "\C-xg" 'workspace-goto)

(load-library "dirtree.el")

(add-to-list 'load-path "~/.emacs.d/vendor/rinari")
(require 'rinari)

(add-to-list 'load-path "~/.emacs.d/vendor/emacs-nav")
(require 'nav)

(add-to-list 'load-path "~/.emacs.d/vendor/robe")
(require 'robe)
(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'ruby-mode-hook 'ruby-end)
(add-hook 'ruby-mode-hook 'robe-mode)

(require 'tabbar)
(tabbar-mode 1)

(global-set-key "\C-z" 'undo)
;; copy line
;; (global-set-key "\C-d" "\C-a\C- \C-n\M-w\C-y")

;; Goto-line short-cut key
(global-set-key "\C-l" 'goto-line)

;; Prefer backward-kill-word over Backspace
(defun backward-kill-word-or-kill-region (arg)
  (interactive "p")
    (if (region-active-p)
      (kill-region (region-beginning)
        (region-end))
    (backward-kill-word arg)))
(global-set-key (kbd "C-w") 'backward-kill-word-or-kill-region)
(define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word-or-kill-region)
(add-hook 'ido-setup-hook
  (lambda ()
    (define-key ido-completion-map (kbd "C-w") 'ido-delete-backward-word-updir)))

;; autoident
(define-key global-map (kbd "RET") 'newline-and-indent)

;; auto save
(desktop-save-mode t)

;; system buffer
(setq x-select-enable-clipboard t)

;; save recent files
(recentf-mode 1)
;; подсвечивать скобочки
(show-paren-mode 1)

(scroll-bar-mode 0)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq org-todo-keywords
        '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

(set-frame-height (selected-frame) 50)
(set-frame-width (selected-frame) 160)
(setq initial-frame-alist '((top . 55) (left . 60)))

;; smart scrolling
(setq scroll-step 1; плавный скроллинг
      scroll-conservatively 100000; не прыгать на середину страницы при скроллинге
      scroll-margin 5; начинать промотку страницы за 5 сток до края
      scroll-preserve-screen-position t); без этого не будет нормально работать страница вниз/вверх
