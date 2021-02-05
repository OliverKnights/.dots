(require 'package)

(setq comp-deferred-compilation t
      c-basic-offset 4
      package-enable-at-startup nil
      org-confirm-babel-evaluate nil
      tramp-default-method "ssh"
      inhibit-startup-screen t
      initial-scratch-message ""
      show-paren-delay t
      custom-file (concat user-emacs-directory "custom.el")
      vc-follow-symlinks t)

(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(add-to-list 'load-path "~/go/pkg/mod/github.com/golangci/lint-1@v0.0.0-20191013205115-297bf364a8e0/misc/emacs/")
(require 'golint)

;; This should be project local really, I think the list of ignores should be like .gitignore patterns
(setq-default project-vc-ignores (list "vendor/"))

;; modes
(auto-save-visited-mode 1)
;; (show-paren-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;;(fido-mode 1)
(delete-selection-mode 1)

;; variables
(defalias 'yes-or-no-p 'y-or-n-p)
(setq leetcode-save-solutions t)
(setq leetcode-directory "~/Projects/leetcode")

;; theme
(load-theme 'leuven t)

;; bindings
(global-set-key (kbd "M-o") 'ace-window)
(global-set-key (kbd "C-x C-j") 'dired-jump)

(global-set-key (kbd "C-c ld") 'lsp-find-definition)
(global-set-key (kbd "C-c lr") 'lsp-find-references)
(global-set-key (kbd "C-c li") 'lsp-goto-implementation)

(global-set-key (kbd "C-c sv") 'vterm)

(global-set-key (kbd "C-c br") 'rename-buffer)

(global-set-key (kbd "C-c oa") 'org-agenda)

;; hooks
(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))
	   
;; packages
(use-package ace-window
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package lsp-mode
  :ensure t
  ;; uncomment to enable gopls http debug server
  ;; :custom (lsp-gopls-server-args '("-debug" "127.0.0.1:0"))
  :commands (lsp lsp-deferred)
  :config (progn
            ;; use flycheck, not flymake
            (setq lsp-prefer-flymake nil)))

(use-package go-mode
  :ensure t
  :hook ((go-mode . lsp-deferred)
	 (go-mode . (lambda () (setq tab-width 4
				     indent-tabs-mode 1)))
         (before-save . lsp-format-buffer)
         (before-save . lsp-organize-imports)
	 (before-save . gofmt-before-save)))

(add-hook 'python-mode-hook 'lsp-deferred)

(defun goall ()
  (interactive)
  (message "Project root: %s" (project-roots )))

(use-package dockerfile-mode
  :ensure t
  :mode ("Dockerfile\\'" . dockerfile-mode))

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :hook ((js2-mode . setup-tide-mode)
	 (js2-mode . lsp-deferred)
	 (js2-mode . (lambda ()
		       (setq js2-basic-offset 4)))))
  
(use-package docker-compose-mode
  :ensure t)

(use-package vterm
  :ensure t)

(use-package docker
  :ensure t
  :bind (("C-c do" . docker)
	 ("C-c dc" . docker-compose)))

(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "|" "DONE")))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (python . t)
   (perl . t)
   (js . t)
   (shell . t)
   (sql . t)
   (org . t)
   (plantuml . t)
   (emacs-lisp . t)
   (lisp . t)    ;; slime - lisp interaction mode
   (gnuplot . t)))
(setq org-agenda-files (list (expand-file-name "~/Projects/notes")))

(use-package edit-indirect
  :ensure t)

(use-package docker-tramp
  :ensure t)

(use-package ob-async
  :ensure t)

(use-package expand-region
  :ensure t
  :bind ("C-=" . 'er/expand-region))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t))

(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns x))
  :config
  (setq exec-path-from-shell-variables '("PATH" "GOPATH"))
  (exec-path-from-shell-initialize))
  
(setq ring-bell-function 'ignore)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq my-tramp-ssh-completions
      '((tramp-parse-sconfig "~/.ssh/config")
        (tramp-parse-shosts "~/.ssh/known_hosts")))

(eval-after-load "tramp"
  '(mapc (lambda (method)
	   (tramp-set-completion-function method my-tramp-ssh-completions))
	 '("fcp" "rsync" "scp" "scpc" "scpx" "sftp" "ssh")))

(use-package plantuml-mode
  :ensure t
  :mode ("\\.plantuml\\'" . plantuml-mode)
  :config
  (setq plantuml-jar-path (expand-file-name "~/Downloads/plantuml.jar"))
  (setq plantuml-default-exec-mode 'jar))

(use-package evil
  :ensure t)

  
(add-to-list
  'org-src-lang-modes '("plantuml" . plantuml))
(setq org-plantuml-jar-path (expand-file-name "~/Downloads/plantuml.jar"))
