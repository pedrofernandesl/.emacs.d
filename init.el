;;
;; ~/.emacs.d/init.el
;;

(require 'package)

;; melpa :: adding an entry to `package-archives`
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

;; declare packages
(setq packages-to-be-installed 
      '(evil
        evil-collection
        magit))

;; iterate on packages and install missing ones
(dolist (pkg packages-to-be-installed)
 (unless (package-installed-p pkg)
  (package-install pkg)))

;; stop creating backup~ files
(setq make-backup-files nil)

;; stop creating #autosave# files
(setq auto-save-default nil)

;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

;; with this option, welcome screen shouldn´t appear
(setq inhibit-startup-screen t)

;; with this option, splash screen shouldn´t appear
(setq inhibit-splash-screen t)

;; set the (line,column) format
(setq column-number-mode t)

;; display line numbers globally
(global-display-line-numbers-mode)

;; hide toolbar
(tool-bar-mode -1)

;; hide menubar
(menu-bar-mode -1)

;; hide scrollbar
(scroll-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango-dark))
 '(ispell-dictionary nil)
 '(package-selected-packages '(magit evil-collection evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#2e3436" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "DAMA" :family "JetBrains Mono")))))

;; evil collection assumes evil-want-keybinding is set o `nil`
;; and evil-want-integration is set to `t` before loading `evil`
;; and `evil-collection`.
(setq evil-want-integration t)
(setq evil-want-keybinding nil)

;; enable evil mode
(require 'evil)
(evil-mode 1)

;; enable evil collection
(when (require 'evil-collection nil t) (evil-collection-init))
