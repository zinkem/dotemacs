  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(js-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/lib/")
(load-library "highlight-chars")
(load-library "init")

;;(add-to-list 'load-path "~/.emacs.d/js2-mode/")
;;(autoload 'js2-mode "js2-mode" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;;set tabs
(setq default-tab-width 2)
(setq-default indent-tabs-mode nil)
(setq javascript-indent-level 2)

;;set colors
(defun set-colors (frame)
  (select-frame frame)
  (set-cursor-color "PaleGoldenrod")
  (set-mouse-color "goldenrod")
  (set-background-color "DarkSlateGrey")
  (set-foreground-color "PaleGoldenrod")

  (set-face-background 'region "blue")
  (set-face-foreground 'region "orange")

  (set-face-background 'mode-line "DarkSlateGray")
  (set-face-foreground 'mode-line "green")

  (set-face-background 'mode-line-inactive "DarkSlateGray")

  (set-face-background 'fringe "DarkSlateGray")

  (set-face-attribute 'default nil :height 80)
)
(add-hook 'after-make-frame-functions 'set-colors)

(set-cursor-color "PaleGoldenrod")
(set-mouse-color "goldenrod")
(set-background-color "DarkSlateGrey")
(set-foreground-color "PaleGoldenrod")

(set-face-background 'region "blue")
(set-face-foreground 'region "orange")

(set-face-background 'mode-line "DarkSlateGray")
(set-face-foreground 'mode-line "green")

(set-face-background 'mode-line-inactive "DarkSlateGray")

(set-face-background 'fringe "DarkSlateGray")

(set-face-attribute 'default nil :height 120)


;(set-face-background 'speedbar-faces "DarkSlateGray")
;(set-face-foreground 'speedbar-faces "goldenrod")

(setq column-number-mode t)
(set-default 'truncate-lines t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode -1)

(cua-mode 0)

(setq auto-mode-alist (cons '("\\.jsp$" . nxml-mode) auto-mode-alist) )

;(add-to-list 'load-path "~/.emacs.d/")
;(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist 
      (append '(("\\.cs$" . java-mode)) auto-mode-alist))


;;(when window-system ;; this starts the speedbar when using windowed mode
;;  (speedbar t))

(global-linum-mode 1) ;;turns on line numbers

(setq frame-title-format
     '("emacs - " (buffer-file-name "%f"
                                    (dired-directory dired-directory "%b")))) ;;changes frame titles

(global-set-key [(tab)] 'smart-tab)
(defun smart-tab ()
  "This smart tab is minibuffer compliant: it acts as usual in
    the minibuffer. Else, if mark is active, indents region. Else if
    point is at the end of a symbol, expands it. Else indents the
    current line."
  (interactive)
  (if (minibufferp)
      (unless (minibuffer-complete)
        (dabbrev-expand nil))
    (if mark-active
        (indent-region (region-beginning)
                       (region-end))
      (if (looking-at "\\_>")
          (dabbrev-expand nil)
        (indent-for-tab-command)))))



(defun tasks ()
	(interactive)
	(shell-command (concat "grep 'task|function' " buffer-file-name) ))

;;(global-set-key (kbd "C-m") 'shell-global)
(global-set-key (kbd "C-n") 'ls)

(defun load-templates ()
  (interactive)
  (shell-command "esm templates" )
)

(defun esm-build ()
  (interactive)
  (shell-command "esm build")
)

;;(global-set-key (kbd "s-c c") 'load-templates)
;;(global-set-key (kbd "s-c b") 'esm-build)
;;(global-set-key (kbd "TAB") 'smart-tab)
