(setq load-path (append '("~/.emacs.d/ash"
                          "~/.emacs.d/misc"
                          "~/.emacs.d/bbdb"
                          "~/.emacs.d/elib"
                          "~/.emacs.d/remember"
                          "~/.emacs.d/org-mode/lisp"
                          "~/.emacs.d/org-mode/contrib/lisp"
                          "~/.emacs.d/cedet/common"
                          "~/.emacs.d/cedet/semantic"
                          "~/.emacs.d/egg"
                          "~/.emacs.d/emacs-jabber"
                          "~/.emacs.d/w3m"
        		  "~/.emacs.d/icicles"
			  "~/.emacs.d/git") load-path))

;; workaround for emacs 23 bug
(or (functionp 'if)
    (defadvice functionp (around workaround-bug (object) activate)
      "Workaround bug."
      (or ad-do-it
            (setq ad-return-value (and (symbolp object) (fboundp object))))))

(require 'ash-customizations)
(require 'ash-refill-mode)
(require 'ash-org)
(require 'ash-eshell)
(require 'ash-java)
(require 'ash-erc)
(require 'w3m-load)
(require 'ash-faces)
(require 'magit)
(require 'anything)
(require 'egg)
(require 'jabber)

(push '(font-backend xft x) default-frame-alist)

(setq Info-default-directory-list 
      (cons "~/src/ash-elisp/info" Info-default-directory-list))

(key-chord-define-global "aa" 'anything)
(key-chord-define-global "s;" 'anything-select-action)
(key-chord-define-global "j;" (lambda () (interactive) (switch-to-buffer "*-jabber-*")))

(setq browse-url-browser-function
      '(("google.com" . w3m-browse-url)
        ("." . browse-url-firefox)))

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(require 'midnight)
(setq midnight-mode t)
(jabber-autoaway-start)

(setq-default show-trailing-whitespace t)

(server-start)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-url-firefox))
 '(display-time-mode t)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(jabber-alert-message-hooks (quote (jabber-message-echo jabber-message-scroll)))
 '(jabber-alert-muc-hooks (quote (jabber-muc-scroll)))
 '(jabber-alert-presence-hooks (quote (jabber-presence-update-roster)))
 '(jabber-mode-line-mode t)
 '(show-paren-mode t)
 '(vc-follow-symlinks t))

(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)
