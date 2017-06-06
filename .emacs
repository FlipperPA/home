;; enable visual feedback on selections
;(setq transient-mark-mode t)

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

;; open up CFM / CFC files in HTML mode
(add-to-list 'auto-mode-alist '("\\.cfm\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.cfc\\'" . html-mode))
