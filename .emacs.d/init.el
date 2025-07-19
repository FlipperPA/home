;; init.el --- Emacs configuration

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(setq column-number-mode t) ;; enable column numbers in status bar

;; Adhere to Python black's 88 character limit per line
(require 'whitespace)
(setq whitespace-line-column 89) ;; 88 + 1
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
(setq-default require-final-newline 'query)

;; Don't make backup files since we always use version control
(setq-default make-backup-files nil)

;; Always use spaces.
(setq-default indent-tab-mode nil)

;; Don't litter up everything with backup files
(setq make-backup-files nil)
