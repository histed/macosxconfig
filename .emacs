;; $Id: .emacs,v 1.46 2005/11/10 21:36:54 Owner Exp $

;; Custom searches (paste and modify in *scratch*)
(defun my-replace-prog ()
  (interactive)
  (query-replace "TotalTrials" "nTrials"))
(global-set-key [f2] 'my-replace-prog)
(global-set-key (kbd "<mouse-2>") nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Package setup - see http://melpa.org/#/getting-started
(when (> emacs-major-version 22)
  (require 'package) 
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/") t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
  (package-initialize))

;;(when (> emacs-major-version 24)
;;  ;; git gutter+ - note Mac system default: emacs 22
;;  (require 'git-gutter+)
;;  (global-git-gutter+-mode t)
;;)
(when (> emacs-major-version 29)
  (which-key-mode)
)

;; misc packages: AuCTeX/reftex
; Turn on RefTeX for AUCTeX, http://www.gnu.org/s/auctex/manual/reftex/reftex_5.html
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
; Make RefTeX interact with AUCTeX, http://www.gnu.org/s/auctex/manual/reftex/AUCTeX_002dRefTeX-Interface.html
(setq reftex-plug-into-AUCTeX t)


;; set up recentf file list
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; easypg setup: do only if found
(when (require 'epa-file nil 'noerror) 
  (epa-file-enable)
  (setq epa-file-select-keys 't) 
  ;; executables, esp for easypg
  (add-to-list 'exec-path "/usr/local/bin"))

;;;; Related to windows windows mode (remember pos state) ;;;;;;;;;;;;;;;;;;;;
;;(add-to-list 'load-path "/Users/histed/Repositories/emacs-lisp/windows")
;;(require 'windows)
;;(win:startup-with-window)
;;(define-key ctl-x-map "C" 'see-you-again)

;; Winner mode - allow window undo
;;(winner-mode)

;;;; Don't let stuff steal window positions ;;;;
(defadvice pop-to-buffer (before cancel-other-window first)
  (ad-set-arg 1 nil))
(ad-activate 'pop-to-buffer)
;; Toggle window dedication
(defun toggle-window-dedicated ()
  "Toggle whether the current active window is dedicated or not"
  (interactive)
  (message
   (if (let (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window 
                                 (not (window-dedicated-p window))))
       "Window '%s' is dedicated"
     "Window '%s' is normal")
   (current-buffer)))
;; Press [pause] key in each window you want to "freeze"
(global-set-key [f4] 'toggle-window-dedicated)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; don't let Aquamacs or anything else use a different custom file
(setq custom-file user-init-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(add-log-mailing-address user-mail-address)
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 215 t)
 '(aquamacs-save-options-on-quit nil)
 '(aquamacs-tool-bar-user-customization nil t)
 '(auto-save-default t)
 '(column-number-mode t)
 '(comint-scroll-show-maximum-output t)
 '(default-frame-alist
   '((cursor-type . box)
     (vertical-scroll-bars . right)
     (internal-border-width . 0)
     (fringe)
     (modeline . t)
     (background-mode . light)
     (right-fringe . 10)
     (left-fringe . 2)
     (border-color . "black")
     (cursor-color . "Red")
     (mouse-color . "black")
     (background-color . "white")
     (foreground-color . "black")
     (font . "-apple-Tahoma-medium-normal-normal-*-14-*-*-*-p-0-iso10646-1")
     (height . 35)
     (width . 80)))
 '(ecb-options-version "2.32")
 '(ediff-diff-options "-b")
 '(epg-gpg-program "/usr/local/bin/gpg1")
 '(fill-column 80)
 '(frame-background-mode 'light)
 '(frame-title-format "%b" t)
 '(mark-even-if-inactive t)
 '(matlab-arg1-max-indent-length 50)
 '(matlab-case-level '(2 . 2))
 '(matlab-cline-start-skip "[ \11]*%[ \11]*" t)
 '(matlab-indent-level 4)
 '(matlab-maximum-indents '((61 80 10) (40 80 10) (91 80 10) (123 80 10)))
 '(matlab-mode-install-path
   (list "~/matlab/Posit-matlab" "/usr/local/matlab/toolbox" "~/matlab"))
 '(matlab-shell-command "/Users/histed/bin/matlab-nodesktop")
 '(matlab-shell-command-switches '(""))
 '(mouse-yank-at-point t)
 '(next-line-add-newlines nil)
 '(ns-antialias-text t)
 '(ns-tool-bar-display-mode nil t)
 '(ns-tool-bar-size-mode nil t)
 '(org-blank-before-new-entry '((heading . auto) (plain-list-item)))
 '(org-list-demote-modify-bullet '(("-" . "+") ("+" . "-") ("1." . "1)") ("1)" . "1.")))
 '(org-list-indent-offset 4)
 '(org-support-shift-select 'always)
 '(org-indent-boundary-char ?*)
 '(org-indent-indentation-per-level 1)
 '(package-selected-packages
   '(gnu-elpa gnu-elpa-keyring-update mixed-pitch git-auto-commit-mode markdown-mode matlab-mode company company-auctex company-bibtex org auctex git-gutter+ git-gutter-fringe writeroom-mode))
 '(post-url-pattern
   '("\\<\\(\\(https?\\|news\\|mailto\\|ftp\\|gopher\\):\\|\\(www\\|ftp\\)\\.\\)[-~A-Za-z0-9._/%$+?#=]+[A-Za-z0-9/#]" "<URL:[^ ]+>"))
 '(py-indent-offset 4)
 '(py-python-command "ipython")
 '(require-final-newline t)
 '(safe-local-variable-values '((c-default-style . linux)))
 '(select-enable-clipboard nil)
 '(set-terminal-coding-system 'utf-8)
 '(tex-dvi-view-command "dviview")
 '(tool-bar-mode nil)
 '(user-mail-address "histed@mit.edu")
 '(vc-follow-symlinks t)
 '(vc-make-backup-files t)
 '(visual-line-mode nil t))

;; Very general things probably dating from 1995 ;;;;;;;;;;;;;;;;

(global-font-lock-mode t)
(transient-mark-mode t)
(column-number-mode t)
(setq default-major-mode 'text-mode)

;;(setq inhibit-startup-message t)
(put 'eval-expression 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Fill, wrapping, indents ;;;;;;;;;;;;;;;;;;;

;;  Use visual-line-mode -- not auto-fill
(when (fboundp 'global-visual-line-mode) (global-visual-line-mode 1)) ;; Does not work in emacs 22
(setq-default indent-tabs-mode nil)

;; indent every 4 spaces
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 
                        52 56 60 64 68 72 76 80))

;; continue lines even when a bunch of buffers are on the screen.
(setq truncate-partial-width-windows nil)

;; C indent style
(defun my-c-mode-hook ()
  (c-set-style "linux"))
(add-hook 'c-mode-hook 'my-c-mode-hook)
;; indent case lines inside switch
(c-set-offset 'case-label '+)


;; Matlab stuff ;;;;;;;;;;;;;;;;

;;200720: now using elpa to install matlab-mode package
;; Replace path below to be where your matlab.el file is.
;;(add-to-list 'load-path "~/Repositories/matlab-emacs")
;;(add-to-list 'load-path "~/Repositories/macosxconfig")
;;(load-library "matlab-load")



;; Enable CEDET feature support for MATLAB code. (Optional)
;; (matlab-cedet-setup)
;;(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
;;(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
;;(autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)

(defvar default-fill-column 100) ;;https://sourceforge.net/p/matlab-emacs/mailman/message/35691778/
(setq matlab-indent-function nil)	; if you want function bodies indented
(setq matlab-verify-on-save-flag t)	; turn on auto-verify on save

(defun my-matlab-mode-hook ()
  (setq fill-column 200)                 ; where auto-fill should wrap; 181109 - set it huge
  (imenu-add-to-menubar "Find")		
  (setq matlab-shell-emacsclient-command "matlab-emacsclient.sh")
)
(defun my-matlab-shell-mode-hook ()
  ;; matlab shell setup; to make 'edit' work
  (setq matlab-shell-emacsclient-command "matlab-emacsclient.sh")
  (font-lock-mode -1) ;; slows it down a ton!
  (toggle-window-dedicated)
  ;; limit comint size for any shell buffers
  (setq comint-buffer-maximum-size 1024)
  (add-hook 'comint-output-filter-functions 'comint-truncate-buffer)


  (server-start)
)
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
(add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)

  ;; note, to get 'edit' to work in matlab shell a few things are needed
  ;; 1. create a shell script to start emacsclient (~/bin/matlab-emacsclient.sh)
  ;;    Necessary because edit.m doesn't work for executables with a path, see openFileOnMac
  ;;    Also need to specify socket location and eval find-file
  ;; 2. set that in matlab.el or in my-matlab-mode-hook(doesn't work in custom for some reason)
  ;;    (matlab-shell-emacsclient-command)
  ;; 3. start the emacsclient server using server-start (that's what this does)
  ;;    


;;;; End of MATLAB stuff ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; Backups and Autosaves
(setq
         backup-by-copying t                 ;; don't clobber symlinks
         backup-directory-alist '(("." . "~/.emacs.d/backups/")) ;; put in one dir
         delete-old-versions t
         kept-new-versions 6
         kept-old-versions 4
         version-control t                   ;; use versioned backups
         auto-save-interval '20
         auto-save-timeout '20
         auto-save-visited-file-name t
)
;;(setq auto-save-file-name-transforms
;;      `((".*" ,temporary-file-directory t)))

(when window-system
  ;; disable toolbar
  ;;   (check to see if tool-bar-mode exists to make emacs20 happy)
  ;;(if (fboundp 'tool-bar-mode)
  ;;    (tool-bar-mode 0))
  ;; enable wheelmouse support, better scrolling speed
  (mwheel-install)
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
  (setq mouse-wheel-progressive-speed nil)  ;; don't accelerate scrolling
  ;; use extended compound-text coding for X clipboard
  (set-selection-coding-system 'compound-text-with-extensions)
)

;; keys
(global-set-key [f5] 'font-lock-mode)
;;(global-set-key [f6] 'auto-fill-mode)
(define-key ctl-x-map "7" 'delete-region)  ;; C-x 7 is delete-region
(define-key global-map "\M-g" 'goto-line)  ;; M-g is goto-line
(define-key ctl-x-map "8" 'indent-region)  ;; C-x 8 is indent-region

(put 'upcase-region 'disabled nil)

;; System-specific switching here ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Which system are we running on?
(defconst aquamacs
        (boundp 'aquamacs-version)
        "Are we running Aquamacs on OS X?")

;; Windows specific details
(if (getenv "COMSPEC")
    (progn 
      (set-default-font "-outline-MiscFixedSC613-normal-r-normal-normal-12-90-96-96-c-60-iso10646-1")
      ;;(load-library "python-mode")
      ;;(setq auto-mode-alist
      ;;    (cons '("\\.py$" . python-mode) auto-mode-alist))
      (add-to-list 'load-path 
                   "c:/program files/MATLAB/R2006b/java/extern/emacslink/lisp")
      (setq x-select-enable-clipboard t)
      )
  )

;; custom aquamacs
(if aquamacs 
    (progn (setq debug-on-error t)
           (setq debug-on-error "arafasdfasdf")
           (one-buffer-one-frame-mode 0)
           (setq confirm-kill-emacs nil)
           ;;(add-to-list 'obof-same-frame-switching-regexps ".*\\.m" ".*\\.py")
           ;;(add-to-list 'obof-same-frame-regexps ".*\\.m" ".*\\.py")
           ;;(add-to-list 'obof-same-frame-regexps ".*")
           (tabbar-mode 0)
	   )
)

;; Mac stuff, not aquamacs
(if (eq system-type 'darwin) 
    (progn
      (setq x-select-enable-clipboard t)
      (setq mac-option-modifier 'meta)  ;; use L and R option keys as meta, if we need special chars, need to cut-and-paste from elsewhere

      ;; Copy and paste using system clip; 170501, from https://apple.stackexchange.com/questions/85222/configure-emacs-to-cut-and-copy-text-to-mac-os-x-clipboard
      (defun copy-from-osx ()
        (shell-command-to-string "pbpaste"))
      (defun paste-to-osx (text &optional push)
        (let ((process-connection-type nil))
          (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
            (process-send-string proc text)
            (process-send-eof proc))))
      (setq interprogram-cut-function 'paste-to-osx)
      (setq interprogram-paste-function 'copy-from-osx)
      
      ;;(set-default-font        "-apple-monaco-medium-r-normal--10-100-72-72-m-100-mac-roman")
      ;;(set-default-font        "-apple-Tahoma-medium-normal-normal-*-12-*-*-*-p-0-iso10646-1")
      ;;(setq mac-allow-anti-aliasing t)  
      ;;(custom-set-faces
         ;;'(default ((t (:stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :family "Tahoma")))))
       ;;'(default ((t (:inherit outline-mode-default :stipple nil :foreground "#ffffff" :strike-through nil :underline nil :slant normal :weight normal :height 140 :width normal :family "Tahoma"))))
       ;;'(lisp-mode-default ((t (:inherit outline-mode-default :stipple nil :foreground "#ffffff" :strike-through nil :underline nil :slant normal :weight normal :height 140 :width normal :family "Tahoma"))))
      ;;)
      )
  )
                              
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Must go last

(if (file-exists-p "~/.emacs.local")
    (load "~/.emacs.local"))


;; This one is to catch emacs automatic changes.  Note emacs only changes the first custom-set-variables, but the last one "wins"


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-mode-default ((t (:inherit outline-mode-default :stipple nil :foreground "#000000" :strike-through nil :underline nil :slant normal :weight normal :height 140 :width normal :family "Tahoma")))))

