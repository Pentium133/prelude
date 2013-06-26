(defun disable-guru-mode ()
  (guru-mode -1)
)
(add-hook 'prelude-prog-mode-hook 'disable-guru-mode t)

(add-hook 'prog-mode-hook 'prelude-turn-off-whitespace t)

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

;; (load-theme 'solarized-dark t)

(load-library "workspaces.el")
(global-set-key "\C-xg" 'workspace-goto)

;; auto save
(desktop-save-mode t)

;; system buffer
(setq x-select-enable-clipboard t)

;; save recent files
(recentf-mode 1)
;; подсвечивать скобочки
(show-paren-mode 1)

(add-to-list 'load-path "~/.emacs.d/vendor/rinari")
(require 'rinari)

(add-to-list 'load-path "~/.emacs.d/vendor/emacs-nav")
(require 'nav)

(scroll-bar-mode 0)

(defun prelude-prog-mode-hook ()
  "Default coding hook, useful with any programming language."
  (flyspell-prog-mode)
  (prelude-local-comment-auto-fill)
  (prelude-turn-off-whitespace)
  (prelude-turn-on-abbrev)
  (prelude-add-watchwords)
  (linum-mode +1))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq org-todo-keywords
        '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
