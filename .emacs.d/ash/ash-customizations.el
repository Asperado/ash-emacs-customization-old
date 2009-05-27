;; Unique buffers
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(add-to-list 'after-make-frame-functions
             (lambda (frame) (select-frame frame) (set-terminal-coding-system 'utf-8)))

(setenv "EDITOR" "emacsclient")

(global-font-lock-mode t)

(defmacro when-emacs (&rest rest)
    `(when (not (string-match "[Xx]emacs" (emacs-version)))
       ,@rest))

(defun make-buffer-big5 () (interactive)
  (set-language-environment "Chinese-BIG5"))
(global-set-key (kbd "C-c b") 'make-buffer-big5)

;; Replace yes or no questions with y or n questions (less typing)
(fset 'yes-or-no-p 'y-or-n-p)

(defun toggle-c-basic-offset ()
   "Switch between two- and four-space indentation (`c-basic-offset')
in Java, C, and C++ modes.  Don't change the amount of indentation for
styles that aren't already using two or four spaces."
   (interactive)
   (if (not (memq major-mode '(c-mode c++-mode java-mode jde-mode)))
       (error "TOGGLE-C-BASIC-OFFSET only works in C, C++, and Java modes."))
   (setq c-basic-offset (if (= c-basic-offset 2) 4 2))
   (message "C-BASIC-OFFSET is now set to %s." c-basic-offset))

(define-key global-map "\M-g" 'goto-line)

(define-key global-map "\M-/" 'hippie-expand)

;; case-insensitive search
(setq case-fold-search t)

;; show parenthesis matching
(show-paren-mode t)

;; highlight region
(setq transient-mark-mode t)

;; define my identity
(setq user-full-name "Andrew Hyatt")

;; Colors work well in shell
(add-hook 'shell-mode-hook (lambda () (ansi-color-for-comint-mode-on)))

;; enable visual feedback on selections
(setq transient-mark-mode t)

(setq blink-cursor-mode t)

(setq bookmark-save-flag 1)

(setq ibuffer-saved-filter-groups
      (quote (("default"
	       ("dired" (mode . dired-mode))
	       ("java" (mode . java-mode))
	       ("shell" (mode . shell-mode))
	       ("eshell" (mode . eshell-mode))
	       ("lisp" (mode . emacs-lisp-mode))
	       ("erc" (mode . erc-mode))
	       ("org" (mode . org-mode))
	       ("git" (mode . git-status-mode))
	       ("c++" (mode . cc-mode))
	       ("emacs" (or
			 (name . "^\\*scratch\\*$")
			 (name . "^\\*Messages\\*$")))
	       ("gnus" (or
			(mode . message-mode)
			(mode . bbdb-mode)
			(mode . mail-mode)
			(mode . gnus-group-mode)
			(mode . gnus-summary-mode)
			(mode . gnus-article-mode)
			(name . "^\\.bbdb$")
			(name . "^\\.newsrc-dribble")))))))

(add-to-list 'auto-mode-alist '("\\.emacs" . emacs-lisp-mode))

(setq ibuffer-sorting-mode 'recency)

(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-switch-to-saved-filter-groups "default")))

;; ffap seems to disable ido for filenames, which has it's own ffap bindings
;(require 'ffap)
;(ffap-bindings)

(setq recentf-max-saved-items 500)
(setq recentf-max-menu-items 60)
(global-set-key [(control f12)] 'ibuffer)
(recentf-mode)

(set-default 'indent-tabs-mode nil)

(display-time-mode 't)

(partial-completion-mode)

(define-key global-map "\C-x\C-j" 'dired-jump)

;; backup stuff from http://wiki.corp.google.com/twiki/bin/view/Main/GnuEmacsBackupFiles
;; Put autosave files (ie #foo#) in one place, *not* scattered all over the
;; file system! (The make-autosave-file-name function is invoked to determine
;; the filename of an autosave file.)
(defvar autosave-dir (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
(make-directory autosave-dir t)

;; Remove unnecessary stuff that takes up space
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(ido-mode)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "jk" 'dabbrev-expand)
(key-chord-define-global "l;" 'magit-status)
(key-chord-define-global "aa" 'anything)
(key-chord-define-global "s;" 'anything-select-action)

(require 'anything)
(require 'anything-config)
(require 'bbdb)

(setq anything-sources
      (list anything-c-source-bookmarks
            anything-c-source-buffers
            anything-c-source-buffer-not-found
            anything-c-source-info-pages
            anything-c-source-man-pages
            anything-c-source-recentf
            anything-c-source-calculation-result
            anything-c-source-evaluation-result
            anything-c-source-complex-command-history
            anything-c-source-google-suggest
            anything-c-source-emacs-commands
            anything-c-source-org-headline
            anything-c-source-jabber-contacts
            anything-c-source-kill-ring
            anything-c-source-emacs-process
            anything-c-source-bbdb))

(add-hook 'dired-mode-hook
          '(lambda ()
             (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)))


(provide 'ash-customizations)
