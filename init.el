;;; package --- summary
;;; commentary:
;;; Code:
;; UI tweaks & landing page

(scroll-bar-mode -1)			; removes scroll bar
(tool-bar-mode -1)			; romoves tool bar
(tooltip-mode -1)			; removes tool tips
(set-fringe-mode 10)			; sets the fringe to size 10
(menu-bar-mode -1)			; removes menu bar
(load-theme 'tango-dark)		; makes emacs readable
(setq visible-bell t)			; enables visible bell
(setq initial-buffer-choice "~/")	; lands user in dired
;;;-------------------------------------------------------------------
;; init pkg srcs

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(require 'use-package)
(setq use-package-always-ensure t)
;;;-------------------------------------------------------------------
;; installed packages via package-install

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(bongo ggtags slime pdf-tools vscode-icon company flycheck dired-sidebar dired-hacks-utils dash ivy))
 '(warning-suppress-log-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(ivy-mode 1)
(global-flycheck-mode)
(add-hook 'after-init-hook 'global-company-mode)
;;;-------------------------------------------------------------------
;; dired-sidebar configuration
(load (expand-file-name "~/.emacs.d/dired-sort-map.el"))
(require 'dired-sort-map)
(setq dired-listing-switches "-al --group-directories-first")
(use-package vscode-icon
  :ensure t
  :commands (vscode-icon-for-file))
(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure nil
  :commands (dired-sidebar-toggle-sidebar))
(setq dired-sidebar-theme 'vscode)
;;;-------------------------------------------------------------------
;; pdf-tools setup
(pdf-tools-install)
;;;-------------------------------------------------------------------
;; Common Lisp configuration
(setq inferior-lisp-program "/usr/bin/sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))

