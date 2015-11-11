(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-modes
   (quote
    (emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode less-css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode ts-mode sclang-mode verilog-mode qml-mode)))
 '(ag-highlight-search t)
 '(ag-reuse-buffers nil)
 '(ag-reuse-window nil)
 '(auto-revert-interval 2)
 '(calendar-mark-diary-entries-flag t)
 '(calendar-view-diary-initially-flag t)
 '(calendar-week-start-day 1)
 '(cider-popup-on-error t)
 '(cider-popup-stacktraces t)
 '(cider-repl-history-file "~/.emacs.d/nrepl-history.log")
 '(cider-show-error-buffer t)
 '(column-number-mode t)
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(ecb-options-version "2.40")
 '(european-calendar-style t)
 '(fill-column 120)
 '(ggtags-global-abbreviate-filename nil)
 '(global-auto-revert-mode t)
 '(global-font-lock-mode t nil (font-lock))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(idle-highlight-idle-time 0.1)
 '(inferior-js-program-command "/usr/local/bin/phantomjs")
 '(inferior-lisp-program "sbcl")
 '(inhibit-startup-screen t)
 '(jedi:install-imenu nil)
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(large-file-warning-threshold nil)
 '(mac-font-panel-mode nil)
 '(magit-use-overlays t)
 '(mark-diary-entries-in-calendar t)
 '(mouse-drag-copy-region t)
 '(mouse-wheel-mode t nil (mwheel))
 '(ns-alternate-modifier (quote none))
 '(ns-command-modifier (quote super))
 '(ns-right-alternate-modifier (quote meta))
 '(ns-right-command-modifier (quote left))
 '(number-of-diary-entries 3)
 '(python-shell-interpreter "python")
 '(scroll-bar-mode (quote right))
 '(shift-select-mode t)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(speedbar-default-position (quote left))
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-right-side nil)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(view-diary-entries-initially t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-keyword-face ((((class color) (min-colors 8)) (:foreground "magenta" :weight bold))))
 '(idle-highlight ((t (:underline t :weight bold)))))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Delete whole line
(defun delete-whole-line ()
  (interactive)
  (beginning-of-line)
  (kill-line))
;; Delete also \n
(setq kill-whole-line t)
;; Replace forward-delete-char with kill-whole-line
(global-set-key (kbd "C-d") 'delete-whole-line)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

(add-hook 'c-mode-hook 'imenu-add-menubar-index)
(add-hook 'c++-mode-hook 'imenu-add-menubar-index)

(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

;; to setup tabs, from: http://emacsblog.org/2007/09/30/quick-tip-spaces-instead-of-tabs/
(setq c-basic-indent 2)
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

(add-to-list 'load-path "/Users/kimmoko/.cabal/share/x86_64-osx-ghc-7.8.3/ghc-mod-5.1.1.0")
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(defun clojure-config ()
  "Clojure configuration"
  (require 'clojure-mode)
  (require 'clj-refactor)
  (add-hook 'clojure-mode-hook (lambda ()
                                 (clj-refactor-mode 1)
                                 (cljr-add-keybindings-with-prefix "C-c C-m")))
  (add-hook 'clojure-mode-hook 'linum-mode)
  (add-hook 'cider-mode-hook 'company-mode)
  (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
  (add-hook 'cider-mode-hook 'highlight-parentheses-mode)
  (add-hook 'cider-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'cider-repl-mode-hook 'company-mode)
  (add-hook 'cider-repl-mode-hook 'subword-mode)
  (add-hook 'cider-repl-mode-hook 'paredit-mode)
  (add-hook 'cider-repl-mode-hook (lambda () (setq show-trailing-whitespace nil)))
  ;(add-hook 'cider-mode-hook 'cider-profile-mode)
  ;(add-hook 'cider-repl-mode-hook 'cider-profile-mode)
  (add-to-list 'auto-mode-alist '("\.cljc$" . clojure-mode))

  (add-hook 'shell-mode (lambda () (setq show-trailing-whitespace nil)))
  (add-hook 'inferior-python-mode (lambda () (setq show-trailing-whitespace nil)))
  (setq nrepl-buffer-name-show-port t)
  (setq cider-prompt-save-file-on-load nil)
  (setq cider-show-error-buffer 'except-in-repl)
  (setq cider-auto-select-error-buffer nil)
  (setq cider-prompt-for-symbol nil)
  (eval-after-load 'flycheck '(flycheck-clojure-setup))
  (define-clojure-indent
    ;; compojure
    (defroutes 'defun)
    (GET 2)
    (POST 2)
    (PUT 2)
    (DELETE 2)
    (HEAD 2)
    (ANY 2)
    (context 2)
    ;; compojure-api
    (GET* 2)
    (POST* 2)
    ;; litmus
    (describe 'defun)
    (given 'defun)
    (then 'defun)
    (before 'defun)
    (before! 'defun)
    (after 'defun)
    ;; midje
    (tabular 'defun)
    ;; jayq
    (let-ajax 'defun)
    ;; om
    (render-state 'defun)
    (init-state 'defun)
    (will-mount 'defun)
    (did-mount 'defun)
    (should-update 'defun)
    (will-receive-props 'defun)
    (will-update 'defun)
    (did-update 'defun)
    (render 'defun)
    (render-state 'defun)
    (display-name 'defun)
    (will-unmount 'defun)
    ;; sablono
    (html 'defun)))

(when (> emacs-major-version 23)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/")
               'APPEND)
  (add-to-list 'package-archives
               '("melpa-stable" . "https://stable.melpa.org/packages/") t)

  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-env "JAVA_HOME"))
  (when window-system
    (load-theme 'deeper-blue t))
  (setq ring-bell-function #'ignore)
  (require 'switch-window)

  (require 'highlight-symbol)
  (global-set-key [(shift f3)] 'highlight-symbol-next)
  (global-set-key [(meta f3)] 'highlight-symbol-prev)
  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  (add-hook 'newlisp-mode-hook 'paredit-mode)
  (add-hook 'comint-mode-hook (lambda ()
                                (when (equal (buffer-name) "*newlisp*")
                                  (paredit-mode 1))))
  (add-hook 'python-mode-hook 'linum-mode)
  (add-hook 'c++-mode-hook 'linum-mode)
  (add-hook 'c-mode-hook 'linum-mode)
  (add-hook 'js-mode-hook 'linum-mode)
  (add-hook 'js2-mode-hook 'linum-mode)
  (require 'flymake-jshint)
  (add-hook 'js-mode-hook 'flymake-mode)
  (require 'iedit)
  (require 'auto-complete-config)
  (ac-config-default)
  (global-set-key (kbd "C-x f") 'find-file-in-repository)
  (global-set-key (kbd "M-z") 'er/expand-region)
  (delete-selection-mode 1)
  (global-set-key (kbd "<f5>") 'ag-project)
  (global-set-key (kbd "<f6>") 'ag-regexp-project-at-point)
  (menu-bar-mode 1)
  (require 'sr-speedbar)
  (global-set-key (kbd "s-b") 'sr-speedbar-toggle)
  (global-set-key (kbd "<C-s-up>")     'buf-move-up)
  (global-set-key (kbd "<C-s-down>")   'buf-move-down)
  (global-set-key (kbd "<C-s-left>")   'buf-move-left)
  (global-set-key (kbd "<C-s-right>")  'buf-move-right)
  (setq mouse-wheel-progressive-speed nil)
  (global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
  (global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
  (global-set-key (kbd "S-C-<down>") 'shrink-window)
  (global-set-key (kbd "S-C-<up>") 'enlarge-window)
  (autoload 'lua-mode "lua-mode" "Lua editing mode." t)
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
  (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                (ggtags-mode 1))))
  (add-hook 'js2-mode 'linum-mode)
  (require 'rainbow-delimiters)
  (clojure-config)
  (require 'smartparens-config)
  (add-hook 'c++-mode-hook (lambda () (smartparens-mode 1)))
  (add-hook 'c-mode-hook (lambda () (smartparens-mode 1)))
  (require 'git-gutter-fringe)
  (require 'project-explorer)
  (autoload 'newlisp-mode "newlisp-mode" "Major mode for newLISP files." t)
  (add-to-list 'auto-mode-alist '("\\.lsp$" . newlisp-mode))
  (add-to-list 'interpreter-mode-alist '("newlisp" . newlisp-mode))
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t)
  (require 'ensime)
  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
  (add-hook 'haskell-mode-hook 'haskell-indent-mode)
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  (require 'highlight-parentheses))

(setq ispell-program-name "aspell"
      ispell-dictionary "finnish"
      ispell-local-dictionary-alist '(("finnish"
                                       "[%.0-9A-Za-z\247\300-\326\330-\366\370-\377-]"
                                       "[^.%0-9A-Za-z\247\300-\326\330-\366\370-\377-]"
                                       "[':]"
                                       nil
                                       ("--dict-dir" "/Library/Application Support/cocoAspell/aspell6-fi-0.7-0" "-d" "finnish" )
                                       nil
                                       utf-8)
                                      ("english"
                                       "[A-Za-z]"
                                       "[^A-Za-z]"
                                       "[']"
                                       nil
                                       ("--dict-dir" "/Library/Application Support/cocoAspell/aspell6-en-7.1-0" "-d" "english" )
                                       nil
                                       utf-8)))

(savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode t)
(put 'narrow-to-region 'disabled nil)
(server-mode 1)

;; handle tmux's xterm-keys
;; put the following line in your ~/.tmux.conf:
;;   setw -g xterm-keys on
(if (getenv "TMUX")
    (progn
      (let ((x 2) (tkey ""))
        (while (<= x 8)
          ;; shift
          (if (= x 2)
              (setq tkey "S-"))
          ;; alt
          (if (= x 3)
              (setq tkey "M-"))
          ;; alt + shift
          (if (= x 4)
              (setq tkey "M-S-"))
          ;; ctrl
          (if (= x 5)
              (setq tkey "C-"))
          ;; ctrl + shift
          (if (= x 6)
              (setq tkey "C-S-"))
          ;; ctrl + alt
          (if (= x 7)
              (setq tkey "C-M-"))
          ;; ctrl + alt + shift
          ;; (if (= x 8)
          ;;        (setq tkey "C-M-S-"))
          ;; super
          (if (= x 8)
              (setq tkey "s-"))

          ;; arrows
          (define-key key-translation-map (kbd (format "M-[ 1 ; %d A" x)) (kbd (format "%s<up>" tkey)))
          (define-key key-translation-map (kbd (format "M-[ 1 ; %d B" x)) (kbd (format "%s<down>" tkey)))
          (define-key key-translation-map (kbd (format "M-[ 1 ; %d C" x)) (kbd (format "%s<right>" tkey)))
          (define-key key-translation-map (kbd (format "M-[ 1 ; %d D" x)) (kbd (format "%s<left>" tkey)))
          ;; home
          (define-key key-translation-map (kbd (format "M-[ 1 ; %d H" x)) (kbd (format "%s<home>" tkey)))
          ;; end
          (define-key key-translation-map (kbd (format "M-[ 1 ; %d F" x)) (kbd (format "%s<end>" tkey)))
          ;; page up
          (define-key key-translation-map (kbd (format "M-[ 5 ; %d ~" x)) (kbd (format "%s<prior>" tkey)))
          ;; page down
          (define-key key-translation-map (kbd (format "M-[ 6 ; %d ~" x)) (kbd (format "%s<next>" tkey)))
          ;; insert
          (define-key key-translation-map (kbd (format "M-[ 2 ; %d ~" x)) (kbd (format "%s<delete>" tkey)))
          ;; delete
          (define-key key-translation-map (kbd (format "M-[ 3 ; %d ~" x)) (kbd (format "%s<delete>" tkey)))
          ;; f1
          (define-key key-translation-map (kbd (format "M-[ 1 ; %d P" x)) (kbd (format "%s<f1>" tkey)))
          ;; f2
          (define-key key-translation-map (kbd (format "M-[ 1 ; %d Q" x)) (kbd (format "%s<f2>" tkey)))
          ;; f3
          (define-key key-translation-map (kbd (format "M-[ 1 ; %d R" x)) (kbd (format "%s<f3>" tkey)))
          ;; f4
          (define-key key-translation-map (kbd (format "M-[ 1 ; %d S" x)) (kbd (format "%s<f4>" tkey)))
          ;; f5
          (define-key key-translation-map (kbd (format "M-[ 15 ; %d ~" x)) (kbd (format "%s<f5>" tkey)))
          ;; f6
          (define-key key-translation-map (kbd (format "M-[ 17 ; %d ~" x)) (kbd (format "%s<f6>" tkey)))
          ;; f7
          (define-key key-translation-map (kbd (format "M-[ 18 ; %d ~" x)) (kbd (format "%s<f7>" tkey)))
          ;; f8
          (define-key key-translation-map (kbd (format "M-[ 19 ; %d ~" x)) (kbd (format "%s<f8>" tkey)))
          ;; f9
          (define-key key-translation-map (kbd (format "M-[ 20 ; %d ~" x)) (kbd (format "%s<f9>" tkey)))
          ;; f10
          (define-key key-translation-map (kbd (format "M-[ 21 ; %d ~" x)) (kbd (format "%s<f10>" tkey)))
          ;; f11
          (define-key key-translation-map (kbd (format "M-[ 23 ; %d ~" x)) (kbd (format "%s<f11>" tkey)))
          ;; f12
          (define-key key-translation-map (kbd (format "M-[ 24 ; %d ~" x)) (kbd (format "%s<f12>" tkey)))
          ;; f13
          (define-key key-translation-map (kbd (format "M-[ 25 ; %d ~" x)) (kbd (format "%s<f13>" tkey)))
          ;; f14
          (define-key key-translation-map (kbd (format "M-[ 26 ; %d ~" x)) (kbd (format "%s<f14>" tkey)))
          ;; f15
          (define-key key-translation-map (kbd (format "M-[ 28 ; %d ~" x)) (kbd (format "%s<f15>" tkey)))
          ;; f16
          (define-key key-translation-map (kbd (format "M-[ 29 ; %d ~" x)) (kbd (format "%s<f16>" tkey)))
          ;; f17
          (define-key key-translation-map (kbd (format "M-[ 31 ; %d ~" x)) (kbd (format "%s<f17>" tkey)))
          ;; f18
          (define-key key-translation-map (kbd (format "M-[ 32 ; %d ~" x)) (kbd (format "%s<f18>" tkey)))
          ;; f19
          (define-key key-translation-map (kbd (format "M-[ 33 ; %d ~" x)) (kbd (format "%s<f19>" tkey)))
          ;; f20
          (define-key key-translation-map (kbd (format "M-[ 34 ; %d ~" x)) (kbd (format "%s<f20>" tkey)))

          (setq x (+ x 1))))))

(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))

(add-hook 'js2-mode-hook '(lambda ()
                            (local-set-key "\C-x\C-e" 'js-send-last-sexp)
                            (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
                            (local-set-key "\C-cb" 'js-send-buffer)
                            (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
                            (local-set-key "\C-cl" 'js-load-file-and-go)))

(defun reloaded-reset ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (cider-interactive-eval
     "(reloaded.repl/reset)")))

(define-key cider-mode-map (kbd "C-'") 'reloaded-reset)
(define-key clojure-mode-map (kbd "C-'") 'reloaded-reset)

(setq magit-last-seen-setup-instructions "1.4.0")
