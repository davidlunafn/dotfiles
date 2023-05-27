(setq inhibit-startup-message t)

(scroll-bar-mode -1)   ; Disable visible scroll bar
(tool-bar-mode -1)     ; Disable tool bar
(tooltip-mode -1)      ; Disable tool tips
(set-fringe-mode 10)   ; Give some  breathing room

(menu-bar-mode -1)     ; Disable menu bar

;; Set up visible bell
(setq viseble-bell t) 

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font":height 180)

(load-theme 'wombat)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Inicialize package sources
(require 'package)

(setq package-archives '(("melpa". "https://melpa.org/packages/")
			 ("org". "https://orgmode.org/elpa/")
			 ("elpa". "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Inicialize use-packages on non-linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


(use-package command-log-mode)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	  :map ivy-minibuffer-map
	  ("TAB" . ivy-alt-done)
	  ("C-l" . ivy-alt-done)
	  ("C-j" . ivy-next-line)
	  ("C-k" . ivy-previus-line)
	  :map ivy-switch-buffer-map
	  ("C-k" . ivy-previus-line)
	  ("C-l" . ivy-done)
	  ("C-d" . ivy-switch-buffer-kill)
	  :map ivy-reverse-i-search-map
	  ("C-k" . ivy-previus-line)
	  ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package doom-themes)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))
