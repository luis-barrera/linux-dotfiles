;; Quitar mensaje de startup
(setq inhibit-startup-message t)

(scroll-bar-mode -1) ;; Desactiva las scrollbars
(tool-bar-mode -1) ;; Desactiva la tool bar
(tooltip-mode -1) ;; Desactiva los tooltips
;;(set-fringe-mode 10) ;; TODO
(menu-bar-mode -1) ;; Desactiva el menubar

;; La pantalla parpadea cuando hay errores
(setq visible-bell t)

;; Establecemos la fuente, para el tamaño multiplicar por 10
;; (set-face-attribute 'default t :font "JetBrainsMono Nerd Font" :height 200)
;; (set-face-attribute 'default nil :font "JetBrainsMono Nerd Font Mono-14")
;; (set-frame-font "JetBrainsMono Nerd Font Mono-14" nil t)
;; (set-face-attribute 'default nil :font "Iosevka-14")
;; (set-frame-font "Iosevka-14" nil t)
;; (set-face-attribute 'default nil :font "FiraCode Nerd Font Mono-14")
;; (set-frame-font "FiraCode Nerd Font Mono-14" nil t)
(set-face-attribute 'default nil :font "VictorMono Nerd Font Mono-14")
(set-frame-font "VictorMono Nerd Font Mono-14" nil t)

;; Cortar lineas
(global-visual-line-mode t)
;; Mostrar en la barra inferior la columna en la que está el cursor
(column-number-mode t)
;; Columna de números
;; (global-display-line-numbers-mode 1)
(defun my-display-numbers-hook ()
  (display-line-numbers-mode t)
  (setq display-line-numbers-type 'relative))
(add-hook 'prog-mode-hook 'my-display-numbers-hook)
(add-hook 'latex-mode-hook 'my-display-numbers-hook)
(add-hook 'LaTeX-mode-hook 'my-display-numbers-hook)
(add-hook 'text-mode-hook (display-line-numbers-mode 'nil))
(add-hook 'org-mode-hook (display-line-numbers-mode 'nil))
;; Numeros de linea relativos
;; BUG: no está funcionando en buffers de org mode, a veces se
;; desactiva en algunos otros
;; (setq display-line-numbers-type 'relative)
;; Deshabilitar la columna de números en algunos modos
;; (dolist (mode '(term-mode-hook
;;      shell-mode-hook))
;;    (add-hook mode (lambda () (display-line-numbers-mode 'nil))))

;; Abrir ventanas a la derecha y no debajo
(setq split-height-threshold nil)
(setq split-width-threshold 0)
;;(setq split-window-right)

;; org-agenda-mode
(defun my-buffer-face-org-agenda()
  "Establece la face para los buffers de org agenda para que sean más pequeños"
  (interactive)
  (setq buffer-face-mode-face '(:family "VictorMono Nerd Font Mono" :height 100))
  ;; (shrink-window-horizontally (- (window-width) 57))
  (buffer-face-mode))
(add-hook 'org-agenda-mode-hook 'my-buffer-face-org-agenda)
;; (add-hook 'org-agenda-mode-hook 'shrink-window-if-larger-than-buffer)

;; Setup del minibuffer
(defun my-minibuffer-setup-hook ()
  "Establece la face para los minibuffers"
  (interactive)
  (setq buffer-face-mode-face '(:family "VictorMono Nerd Font Mono" :height 100))
  (buffer-face-mode))
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

;; Setup de calenda-mode
(defun my-buffer-face-calendar()
  "Establece la face para los buffers de org agenda para que sean más pequeños"
  (interactive)
  (setq buffer-face-mode-face '(:family "VictorMono Nerd Font Mono" :height 100))
  (buffer-face-mode))
(add-hook 'calendar-mode-hook 'my-buffer-face-calendar)

;; ##############################
;; Package administrator
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;;(package-refresh-contents)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-pyright-disable-organize-imports t)
 '(lsp-pyright-typechecking-mode "basic")
 '(lsp-pyright-use-library-code-for-types t)
 '(lsp-pyright-venv-directory "")
 '(lsp-pyright-venv-path "")
 '(package-selected-packages
   '(workgroups2 company-tabnine evil-surround dashboard page-break-lines lsp-haskell haskell-mode edwina ein elpy better-defaults indent-guide diff-hl magit-todos evil-nerd-commenter aggressive-indent browse-kill-ring undo-fu-session drag-stuff linum-relative undo-tree centaur-tabs org-roam-ui cdlatex company-auctex auctex lsp-ui company-box parrot solaire-mode multiple-cursors visual-fill-column all-the-icons-completion treemacs-evil org-evil evil-org evil-numbers evil-smartparens treemacs-all-the-icons treemacs-magit treemacs-projectile smartparens comment-tags rainbow-delimiters yasnippet-snippets yasnippet emmet-mode php-mode web-mode lsp-java lsp-pyright lsp-treemacs lsp-mode company-php company-web alert pomm deft org-download org-superstar org-roam evil-collection doom-themes doom-modeline counsel-projectile projectile helpful which-key command-log-mode undo-fu company ivy-hydra ivy-rich forge magit general ivy counsel swiper use-package)))

;; (unless (package-installed-p 'use-package)
;;    (package-install 'use-package))

;; (unless (package-installed-p 'swiper)
;;    (package-install 'swiper))

;; (unless (package-installed-p 'counsel)
;;    (package-install 'counsel))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-posframe ((t (:family "VictorMono Nerd Font Mono" :height 0.8))))
 '(mode-line ((t (:family "VictorMono Nerd Font Mono" :height 0.8))))
 '(mode-line-inactive ((t (:family "VictorMono Nerd Font Mono" :height 0.8))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.25))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.15))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.05))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))


;; ##############################
;; Auto-completado
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))
;; Quita el símbolo ^ de los buffers de ivy
(setq ivy-initial-inputs-alist nil)

;; Interfaz para encontrar cualquier cosa
(use-package counsel
  :bind (("M-x" . counsel-M-x)
   ("C-x b" . counsel-ibuffer)
   ("C-x C-f" . counsel-find-file)
   :map minibuffer-local-map
   ("C-r" . 'counsel-minibuffer-history)))
;; Cambiar entre buffers, si queremos mostrar buffer especiales (los que empiezan con *) usar "C-x b"
(setq ivy-ignore-buffers '("\\` " "\\`\\*"))
(global-set-key (kbd "C-M-j") 'counsel-switch-buffer)
(global-set-key (kbd "M-o")  'mode-line-other-buffer)

;; Iconos para la barra de estado
;; Después de instalar el paquete, correr M-x all-the-icons-install-fonts
(use-package all-the-icons
  :if (display-graphic-p))

;; Barra de estado inferior
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 10))
(setq doom-modeline-buffer-file-name-style 'truncate-upto-root)

;; Temas, desde Doom-Emacs
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled

  ;; Temas favoritos
  ;; Si queremos tener una lista completa de temas usar M-x counsel-load-theme [C-M-n | C-M-p]
  ;; (load-theme 'doom-one t)
  ;; (load-theme 'doom-acario-dark t)
  ;; (load-theme 'doom-gruvbox t)
  ;; (load-theme 'doom-Iosvkem t)
  ;; (load-theme 'doom-manegarm t)
  ;; (load-theme 'doom-peacock t)
  ;; (load-theme 'doom-tomorrow-night t)
  (load-theme 'doom-old-hope t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  ;; (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; Paréntesis de colores
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Which key
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; Muestra más info acerca de los comandos, así como su keybinding si está disponible
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;; Mejora al sistema de ayuda para la documentación de Emacs
(use-package helpful
  :ensure t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;; Leader key con <espacio>, como en vim
;; (use-package general
;;   :config
;;   (general-create-definer rune/leader-keys
;;        :keymaps '(normal visual emacs)
;;        ;:prefix "SPC"
;;        :prefix "C-SPC")

;;   ;; Estos son ejemplos de cómo se definen los keybindings
;;   (rune/leader-keys
;;    "t" '(:ignore t :which-key "toggles")
;;    "tt" '(counsel-load-theme :which-key "choose theme")))

;; Ayuda a repetir comandos
;; (use-package hydra)



;; ##############################
;; Keybindings
;; Evil mode, capa de vim
(unless (package-installed-p 'evil)
  (package-install 'evil))
(setq evil-want-keybinding nil)
(setq evil-want-integration t)
(require 'evil)
(evil-mode 1)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "gcc") 'evilnc-comment-or-uncomment-lines)
;; (evil-define-key 'insert 'global (kbd "jk") 'evil-normal-state)
(setq evil-ex-search-vim-style-regexp t)
(setq evil-in-single-undo t)

;; Configuración de keybindings de evil para varios modos
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; Tener bloques de código sin perder el nivel de jerarquía
;; org-mode no deja que metas un subtítulo y luego regreses al título anterior
;; cosa que puedes hacer en LaTeX, pero aquí no. Para lograr algo similar está
;; este paquete que pertenece a org-mode pero está desactivado por defecto.
;; Para usarlo está el key =C-c C-x t=
(require 'org-inlinetask)

;; Incremento/Decremento como en vim
(use-package evil-numbers
  :after evil)
(evil-define-key '(normal visual) 'global (kbd "+") 'evil-numbers/inc-at-pt)
(evil-define-key '(normal visual) 'global (kbd "-") 'evil-numbers/dec-at-pt)

;; Mejor soporte para undo y redo
(use-package undo-fu
  :after evil)
(define-key evil-normal-state-map "u" 'undo-fu-only-undo)
(define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo)

;; Usa tecla ESC para cancelar comandos
(define-key isearch-mode-map [escape] 'isearch-abort)
(define-key isearch-mode-map "\e" 'isearch-abort)
(global-set-key [escape] 'keyboard-escape-quit)

;; Ver los posibles undo, mostrado en forma de un arbol
;; Con =C-x u= podemos ver el arbol y escoger
(use-package undo-tree
  :config
  (global-undo-tree-mode))


;; ##############################
;; Git y manejo de proyectos
;; Manejo de proyectos según le directorio en el que estamos
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; Si entramos a cualquier directorio dentro de ~/dev se carga una
  ;; configuración global dentro de ese directorio
  (when (file-directory-p "~/dev")
    (setq projectile-project-search-path '("~/dev")))
  ;; Cuando entramos a un directorio, dired también se mueva a ese
  ;; directorio
  (setq projectile-switch-project-action #'projectile-dired))

;; Counsel para projectile
(use-package counsel-projectile
  :config (counsel-projectile-mode))

;; Soporte para git y otros vcs
;; Debemos entrar a magit-status, con s podemos mover archivos al unstaged y con u los sacamos
;; (use-package magit
;;   :custom
;;   (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; Soporte de Magit para GitHub y GitLab
;; (use-package forge)



;; ##############################
;; Org mode
(use-package org
  :hook ((org-mode . org-indent-mode))
  ;; (org-mode . org-toggle-pretty-entities)
  :config
  ;; Guardar los buffers después de hacer un refile
  (advice-add 'org-refile :after 'org-save-all-org-buffers)
  ;; Deja de insertar indentación en los bloques de código
  (setq org-edit-src-content-indentation 0)
  ;; Seguir links al dar RET sobre ellos
  (setq org-return-follows-link t)
  ;; Abrir los links en el mismo frame
  (setq org-link-frame-setup '((file . find-file)))
  ;; Símbolo a usar cuando cuando hay texto oculto por usar S-TAB
  (setq org-ellipsis "⥥")
  ;; Elimina los símbolos que se usan para modificar los caracteres,
  ;; por ejemplo: los * que se usan para hacer negritas
  (setq org-hide-emphasis-markers nil)
  ;; Org agenda
  ;; Guardar un log de las tareas completas
  (setq org-agenda-start-with-log-mode t)
  ;; Guardar la fecha cuando marcamos algo como completo
  (setq org-log-done 'time)
  ;; Mantener el log dentro de un drawer, de manerar que se hace un fold
  (setq org-log-into-drawer t)
  ;; Archivos considerados por org-agenda
  (setq org-agenda-files '("~/org-mode/Tareas21I.org" "~/org-mode/Clases21I.org" "~/org-mode/todos.org"))
  ;; (setq org-agenda-files '("~/org-mode/tasks.org" "~/org-mode/clases21O.org"))
  ;; Mostrar 10 días en la vista de semana de org-agenda.
  (setq org-agenda-span 10)
  ;; Keywords para tasks
  (setq org-todo-keywords '((sequence "TODO" "DOING" "|" "DONE"))))

;; Seguir links de org mode al dar RET sobre ellos
(setq org-return-follows-link t)
;; Maping para abrir la agenda
(global-set-key (kbd "C-c a") 'org-agenda-list)
;;
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
;; Cambiar el formato de los codeblocks para usar minted en luga de verbatim
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
(setq org-latex-minted-options '(("breaklines" "true")
                                 ("breakanywhere" "true")
                                 ("breaksymbolleft" "{}")
                                 ("breaksymbolright" "{}")
                                 ("breakanywheresymbolpre" "{}")))

;; Cambiar los símbolos de los headings
(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
  :config
  ;; Caracteres a usar para cada nivel
  (setq org-superstar-headline-bullets-list '("𝍠" "𝍡" "𝍢" "𝍣" "𝍤" "𝍥" "𝍦" "𝍧"))
  ;; Al llegar más allá de 8 niveles, nil=usar siempre el último caracter, t=ciclar entre los elementos
  (setq org-superstar-cycle-headline-bullets 'nil)
  ;; Ocultar un puntito que sale enfrente de los heading
  (setq org-hide-leading-stars nil)
  (setq org-superstar-leading-bullet ?\s)
  (setq org-indent-mode-turns-on-hiding-stars nil))

;; Zettlekasten en org-mode
(use-package org-roam
  :ensure t
  :init (setq org-roam-v2-ack t)
  :custom
  (setq org-roam-directory (file-truename "~/org-roam"))
  ;;(setq org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ;; Esta es la función con la que debemos empezar
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-M-i" . completion-at-point)
         ("C-c n t" . org-roam-tag-add)
         ("C-c n c" . org-id-get-create))
  :config
  ;;(org-roam-setup)
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  (setq org-roam-completion-everywhere t))

(setq org-roam-mode-section-functions
      (list #'org-roam-backlinks-section
            #'org-roam-reflinks-section
            #'org-roam-unlinked-references-section
            ))

;; Templates para org-roam
(setq org-roam-capture-templates
      '(("d" "default" plain "%?"
         :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n")
         :unnarrowed t)
        ("c" "Nota completa" plain "%?"
         :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                            ":PROPERTIES:
:AUTHOR: %^{Author|No Author}
:ROAM_REFS: %^{Link o Ref|No Ref}
:ROAM_ALIAS: %^{Alias|No Alias}
:TYPE: %^{Type|Articulo|Noticia|Libro|Video|Nota Personal|Notas de Clase|Paper Científico}
:DATE: %T
:CREATOR: luis-barrera
:END:
#+title: ${title}
#+filetags:
")
         :unnarrowed t)))

;; Pegar imágenes en las notas desde el clipboard o abre una app para hacer screenshot
(use-package org-download
  :after org
  :bind
  (:map org-mode-map
        (("s-Y" . org-download-screenshot)
         ("s-y" . org-download-yank))))

;; Encontrar palabras dentro de los archivos
(use-package deft
    :config
    (setq deft-directory org-roam-directory
          deft-recursive t
          deft-use-filename-as-title t)
    :bind
    ("C-c n d" . deft))

;; Evil para org, hay algunas teclas que no funcionan correctamente en org mode debido a evil
(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . evil-org-mode)
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

;; Poner bordes a los lados del editor, solo en org-mode
(use-package visual-fill-column
  :defer t
  :hook (org-mode . efs/org-mode-visual-fill))

;; Poner bordes a los lados del editor, solo en org-mode
(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
  visual-fill-column-center-text t)
  (visual-fill-column-mode 1))



;; TODO: partes desordenadas, funcionan pero ponerlas en su lugar correspondiente
;; Quitar los keybindings de RET y SPC
(defun my-move-key (keymap-from keymap-to key)
     (define-key keymap-to key (lookup-key keymap-from key))
     (define-key keymap-from key nil))
(my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
(my-move-key evil-motion-state-map evil-normal-state-map " ")

;; Poner los archivos de Backup (los que terminan en ~) en otro lugar
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;; Transparencia en el fondo
;; TODO: no me gusta que también se ponga transparante el fondo, así que por el momento lo desactivo
(defun toggle-transparency ()
   (interactive)
   (let ((alpha (frame-parameter nil 'alpha)))
     (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
          '(90 . 50) '(100 . 100)))))
 ;; (global-set-key (kbd "C-c t") 'toggle-transparency)

;; Guardar los buffers abiertos antes de cerrar el editor
(desktop-save-mode 1)


;; Notificaciones de escritorio para los eventos de org-agenda, por
;; defecto Emacs no puede enviar notificaciones al escritorio
(require 'appt)
(appt-activate t)

(setq appt-message-warning-time 5) ; Show notification 5 minutes before event
(setq appt-display-interval appt-message-warning-time) ; Disable multiple reminders
(setq appt-display-mode-line nil)

;; Use appointment data from org-mode
(defun my-org-agenda-to-appt ()
  (interactive)
  (setq appt-time-msg-list nil)
  (org-agenda-to-appt))

;; Update alarms when...
;; (1) ... Starting Emacs
(my-org-agenda-to-appt)
;; (2) ... Everyday at 12:05am (useful in case you keep Emacs always on)
(run-at-time "12:05am" (* 24 3600) 'my-org-agenda-to-appt)
(run-at-time "07:35am" (* 24 3600) 'my-org-agenda-to-appt)
;; (3) ... When TODO.txt is saved
(add-hook 'after-save-hook
          '(lambda ()
             (if (string= (buffer-file-name) (concat (getenv "HOME") "/org-mode/Tareas21I.org"))
                 (my-org-agenda-to-appt))))
(add-hook 'after-save-hook
          '(lambda ()
             (if (string= (buffer-file-name) (concat (getenv "HOME") "/org-mode/Clases21I.org"))
                 (my-org-agenda-to-appt))))

; Display appointments as a window manager notification
(setq appt-disp-window-function 'my-appt-display)
(setq appt-delete-window-function (lambda () t))

(setq my-appt-notification-app (concat (getenv "HOME") "/bin/appt-notification"))

(defun my-appt-display (min-to-app new-time msg)
  (if (atom min-to-app)
    (start-process "my-appt-notification-app" nil my-appt-notification-app min-to-app msg)
  (dolist (i (number-sequence 0 (1- (length min-to-app))))
    (start-process "my-appt-notification-app" nil my-appt-notification-app (nth i min-to-app) (nth i msg)))))

;; Notificaciones en el escritorio
(setq alert-default-style 'libnotify)



;; ##############################
;; Web-mode
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

;; Resalta las columnas
(setq web-mode-enable-current-column-highlight t)
;; (setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-element-highlight 'nil)

;; Autocompletado en línea
(defun my-web-mode-hook ()
  (set (make-local-variable 'company-backends) '(company-css company-web-html company-yasnippet company-files))
)

;; Activar emmet en web-mode
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'web-mode-hook  'emmet-mode)
;; Editar js, css en html-mode
(add-hook 'web-mode-before-auto-complete-hooks
    '(lambda ()
     (let ((web-mode-cur-language
        (web-mode-language-at-pos)))
               (if (string= web-mode-cur-language "php")
         (yas-activate-extra-mode 'php-mode)
         (yas-deactivate-extra-mode 'php-mode))
               (if (string= web-mode-cur-language "css")
         (setq emmet-use-css-transform t)
         (setq emmet-use-css-transform nil)))))
;; Emmet usa por defecto dos tabs(o espacios) para indentar, usar solo 1 tab
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert t)))
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 1)))
;; Mover el cursor entre quotes
(setq emmet-move-cursor-between-quotes t) ;; default nil

;; Hora en la modeline
(display-time-mode 1)

;; Mover la indentación por bloques
(global-set-key (kbd "C->") 'indent-rigidly-right-to-tab-stop)
(global-set-key (kbd "C-<") 'indent-rigidly-left-to-tab-stop)

;; Autocompletado con company
;; Funciona a través de backends, para una lista completa de los que
;; están habilitados usar el comando =M-x customize-variable RET
;; company-backends=.
(add-hook 'after-init-hook 'global-company-mode)
(use-package company-posframe)
(company-posframe-mode 1)
(setq company-tooltip-offset-display 'lines)
(setq company-tooltip-minimum 4)
(setq company-tooltip-flip-when-above t)

;; Snippets, autocompletado
;; (yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Autopair paréntesis
(electric-pair-mode)

;; Neotree, file manager
;; (global-set-key [f8] 'neotree-toggle)
;; (setq neo-smart-open t)
;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; (defun neotree-setup ()(interactive)(progn(text-scale-adjust 0)(text-scale-decrease 0.4)))
;; (add-hook 'neo-after-create-hook
;;           (lambda (_)(call-interactively 'neotree-setup))
;;           (global-visual-line-mode 'nil)
;;           (display-line-numbers-mode 'nil))
;; Treemacs, mejor file manager
;; Para agregar más directorios correr el comando treemacs-edit-workspace
(global-set-key [f8] 'treemacs)
(use-package treemacs-evil)
(lsp-treemacs-sync-mode 1)

;; Quita el (point)ath completo para symbolik links
(setq find-file-visit-truename t)

;; Solaire-mode
(solaire-global-mode +1)

;; Viva la parrot revolution!!
(use-package parrot
  :config
  (parrot-mode))
;; default confused emacs nyan rotating science thumbsup
(parrot-set-parrot-type 'emacs)
;; Infinitamente
;; (setq parrot-num-rotations nil)
(setq parrot-num-rotations 6)

;; LSP-mode
;; Algunos comandos interesantes:
;;   * lsp-find-definition
;;   * lsp-find-references
;;   * lsp-modeline-diagnostics-mode, es un modo para mostrar los errores del código en el mode-line
;;   * lsp-modeline-code-actions-mode, modo para mostrar las acciones disponibles
;; Alguna config rara, pero necesaria
(setq gc-cons-threshold 200000000)
;; Cantidad de información que lee Emacs
(setq read-process-output-max (* 50 1024 1024))
;; Tasa de refresco
(setq lsp-idle-delay 0.500)
;; Los logs pueden bajar el performance
(setq lsp-log-io nil) ; if set to true can cause a performance hit
;; Para que se funcione con company
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0) ;; default is 0.2
;; Mostrar el número de errores en el mode-line
(with-eval-after-load 'lsp-mode
  ;; :global/:workspace/:file
  (setq lsp-modeline-diagnostics-scope :workspace))
;; LSP-java, instalar el package lsp-java
(use-package lsp-java)
(add-hook 'java-mode-hook #'lsp)
;; sql
;; Aquí se deben definir las conexiones a las BD que querramos usar, luego correr el comando M-x lsp-sqls-*
;; (setq lsp-sqls-connections
;;     '(((driver . "mysql") (dataSourceName . "yyoncho:local@tcp(localhost:3306)/foo"))
;;       ((driver . "postgresql") (dataSourceName . "host=127.0.0.1 port=5432 user=yyoncho password=local dbname=sammy sslmode=disable"))))

;; Config para lsp
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-signature-doc-lines 1)
  (setq lsp-enable-snippet t)
  :hook ((js2-mode . lsp-mode)
         (python-mode . lsp-mode)
         (web-mode . lsp-mode)
         (lsp-mode . lsp-enable-which-key-integration)
         (lsp-mode . lsp-completion-mode))
  :commands (lsp-deferred))

;; Python
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

;; optionally
;; (use-package lsp-ui :commands lsp-ui-mode)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))

(use-package lsp-ui
  :commands lsp-ui-mode)

;; pomm
(setq pomm-audio-enabled t)
(setq pomm-audio-player-executable "/sbin/paplay")

;; Multiple cursores
;; Para salir de este modo, usar C-g o <return>, para meter un salto de linea dentro del modo usar C-j
(use-package multiple-cursors)
;; Soporte para evil-mode
(setq mc/cmds-to-run-for-all
      '(
        electric-newline-and-maybe-indent
        evil-backward-char
        evil-delete-char
        evil-escape-emacs-state
        evil-escape-insert-state
        evil-exit-emacs-state
        evil-forward-char
        evil-insert
        evil-next-line
        evil-normal-state
        evil-previous-line
        forward-sentence
        kill-sentence
        org-self-insert-command
        sp-backward-delete-char
        sp-delete-char
        sp-remove-active-pair-overlay
        ))
;; Si tenemos seleccionado muchas líneas, agregar un cursor al inicio de estas
(global-set-key (kbd "C-c C-S-c") 'mc/edit-lines)
;;;; Editar string similares a la que está seleccionada
;; Si no hay texto seleccionado, solo se brinca a la misma posición en la linea anterior o posterior.
;; Para que funcione con evil-mode, dar <esc> después de seleccionar para luego entrar al insert-mode.
;; Esto porque estamos usando visual-mode y debemos salirnos de este modo para luego entrar al insert-mode.
;; Editar string siguiente similar
(global-set-key (kbd "C-c C-<") 'mc/mark-next-like-this)
;; Editar string anterior similar
(global-set-key (kbd "C-c C->") 'mc/mark-previous-like-this)
;; Este obligatoriamente debe tener texto seleccionado
;; Editar todas las strings similares
(global-set-key (kbd "C-c C-a") 'mc/mark-all-like-this)

;; Plugin para ver y administrar code-tags
;; TODO:
;; (autoload 'comment-tags-mode "comment-tags-mode")
(setq comment-tags-keymap-prefix (kbd "C-c C-t"))
(use-package comment-tags
  :hook ((prog-mode-hook . comment-tags-mode)))
(with-eval-after-load "comment-tags"
  (setq comment-tags-keyword-faces
        `(("TODO" . ,(list :weight 'bold :foreground "#28ABE3"))
          ("FIXME" . ,(list :weight 'bold :foreground "#DB3340"))
          ("BUG" . ,(list :weight 'bold :foreground "#DB3340"))
          ("HACK" . ,(list :weight 'bold :foreground "#E8B71A"))
          ("KLUDGE" . ,(list :weight 'bold :foreground "#E8B71A"))
          ("XXX" . ,(list :weight 'bold :foreground "#F7EAC8"))
          ("INFO" . ,(list :weight 'bold :foreground "#F7EAC8"))
          ("DONE" . ,(list :weight 'bold :foreground "#1FDA9A"))))
  (setq comment-tags-comment-start-only t
        comment-tags-require-colon t
        comment-tags-case-sensitive t
        comment-tags-show-faces t
        comment-tags-lighter nil))
(add-hook 'prog-mode-hook 'comment-tags-mode)

;; Config para dired
(put 'dired-find-alternate-file 'disabled nil)

;; Smart paréntesis
(require 'smartparens-config)
(add-hook 'prog-mode-hook #'smartparens-mode)

;; Company-mode con iconos
(use-package company-box
  :hook (company-mode . company-box-mode))

;; LaTeX en Emacs
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(add-hook 'LaTeX-mode-hook 'outline-minor-mode)
(add-hook 'LaTeX-mode-hook 'prettify-symbols-mode)
(add-hook 'LaTeX-mode-hook 'yas-minor-mode-on)
(add-hook 'LaTeX-mode-hook 'cdlatex-mode)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-cdlatex)   ; with Emacs latex mode

(use-package latex
  :ensure auctex
  :hook ((LaTeX-mode . prettify-symbols-mode))
  :bind (:map LaTeX-mode-map
         ("C-S-e" . latex-math-from-calc))
  :config
  ;; Format math as a Latex string with Calc
  (defun latex-math-from-calc ()
    "Evaluate `calc' on the contents of line at point."
    (interactive)
    (cond ((region-active-p)
           (let* ((beg (region-beginning))
                  (end (region-end))
                  (string (buffer-substring-no-properties beg end)))
             (kill-region beg end)
             (insert (calc-eval `(,string calc-language latex
                                          calc-prefer-frac t
                                          calc-angle-mode rad)))))
          (t (let ((l (thing-at-point 'line)))
               (end-of-line 1) (kill-line 0)
               (insert (calc-eval `(,l
                                    calc-language latex
                                    calc-prefer-frac t
                                    calc-angle-mode rad))))))))

(use-package preview
  :after latex
  :hook ((LaTeX-mode . preview-larger-previews))
  :config
  (defun preview-larger-previews ()
    (setq preview-scale-function
          (lambda () (* 1.25
                   (funcall (preview-scale-from-face)))))))

;; CDLatex settings
(use-package cdlatex
  :ensure t
  :hook (LaTeX-mode . turn-on-cdlatex)
  :bind (:map cdlatex-mode-map
              ("<tab>" . cdlatex-tab)))

;; Yasnippet settings
(use-package yasnippet
  :ensure t
  :hook ((LaTeX-mode . yas-minor-mode)
         (post-self-insert . my/yas-try-expanding-auto-snippets))
  :config
  (use-package warnings
    :config
    (cl-pushnew '(yasnippet backquote-change)
                warning-suppress-types
                :test 'equal))

  (setq yas-triggers-in-field t)

  ;; Function that tries to autoexpand YaSnippets
  ;; The double quoting is NOT a typo!
  (defun my/yas-try-expanding-auto-snippets ()
    (when (and (boundp 'yas-minor-mode) yas-minor-mode)
      (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
        (yas-expand)))))

;; CDLatex integration with YaSnippet: Allow cdlatex tab to work inside Yas
;; fields
(use-package cdlatex
  :hook ((cdlatex-tab . yas-expand)
         (cdlatex-tab . cdlatex-in-yas-field))
  :config
  (use-package yasnippet
    :bind (:map yas-keymap
           ("<tab>" . yas-next-field-or-cdlatex)
           ("TAB" . yas-next-field-or-cdlatex))
    :config
    (defun cdlatex-in-yas-field ()
      ;; Check if we're at the end of the Yas field
      (when-let* ((_ (overlayp yas--active-field-overlay))
                  (end (overlay-end yas--active-field-overlay)))
        (if (>= (point) end)
            ;; Call yas-next-field if cdlatex can't expand here
            (let ((s (thing-at-point 'sexp)))
              (unless (and s (assoc (substring-no-properties s)
                                    cdlatex-command-alist-comb))
                (yas-next-field-or-maybe-expand)
                t))
          ;; otherwise expand and jump to the correct location
          (let (cdlatex-tab-hook minp)
            (setq minp
                  (min (save-excursion (cdlatex-tab)
                                       (point))
                       (overlay-end yas--active-field-overlay)))
            (goto-char minp) t))))

    (defun yas-next-field-or-cdlatex ()
      (interactive)
      "Jump to the next Yas field correctly with cdlatex active."
      (if (bound-and-true-p cdlatex-mode)
          (cdlatex-tab)
        (yas-next-field-or-maybe-expand)))))

;; Array/tabular input with org-tables and cdlatex
(use-package org-table
  :after cdlatex
  :bind (:map orgtbl-mode-map
              ("<tab>" . lazytab-org-table-next-field-maybe)
              ("TAB" . lazytab-org-table-next-field-maybe))
  :init
  (add-hook 'cdlatex-tab-hook 'lazytab-cdlatex-or-orgtbl-next-field 90)
  ;; Tabular environments using cdlatex
  (add-to-list 'cdlatex-command-alist '("smat" "Insert smallmatrix env"
                                        "\\left( \\begin{smallmatrix} ? \\end{smallmatrix} \\right)"
                                        lazytab-position-cursor-and-edit
                                        nil nil t))
  (add-to-list 'cdlatex-command-alist '("bmat" "Insert bmatrix env"
                                        "\\begin{bmatrix} ? \\end{bmatrix}"
                                        lazytab-position-cursor-and-edit
                                        nil nil t))
  (add-to-list 'cdlatex-command-alist '("pmat" "Insert pmatrix env"
                                        "\\begin{pmatrix} ? \\end{pmatrix}"
                                        lazytab-position-cursor-and-edit
                                        nil nil t))
  (add-to-list 'cdlatex-command-alist '("tbl" "Insert table"
                                        "\\begin{table}\n\\centering ? \\caption{}\n\\end{table}\n"
                                        lazytab-position-cursor-and-edit
                                        nil t nil))
  :config
  ;; Tab handling in org tables
  (defun lazytab-position-cursor-and-edit ()
    ;; (if (search-backward "\?" (- (point) 100) t)
    ;;     (delete-char 1))
    (cdlatex-position-cursor)
    (lazytab-orgtbl-edit))

  (defun lazytab-orgtbl-edit ()
    (advice-add 'orgtbl-ctrl-c-ctrl-c :after #'lazytab-orgtbl-replace)
    (orgtbl-mode 1)
    (open-line 1)
    (insert "\n|"))

  (defun lazytab-orgtbl-replace (_)
    (interactive "P")
    (unless (org-at-table-p) (user-error "Not at a table"))
    (let* ((table (org-table-to-lisp))
           params
           (replacement-table
            (if (texmathp)
                (lazytab-orgtbl-to-amsmath table params)
              (orgtbl-to-latex table params))))
      (kill-region (org-table-begin) (org-table-end))
      (open-line 1)
      (push-mark)
      (insert replacement-table)
      (align-regexp (region-beginning) (region-end) "\\([:space:]*\\)& ")
      (orgtbl-mode -1)
      (advice-remove 'orgtbl-ctrl-c-ctrl-c #'lazytab-orgtbl-replace)))

  (defun lazytab-orgtbl-to-amsmath (table params)
    (orgtbl-to-generic
     table
     (org-combine-plists
      '(:splice t
                :lstart ""
                :lend " \\\\"
                :sep " & "
                :hline nil
                :llend "")
      params)))

  (defun lazytab-cdlatex-or-orgtbl-next-field ()
    (when (and (bound-and-true-p orgtbl-mode)
               (org-table-p)
               (looking-at "[[:space:]]*\\(?:|\\|$\\)")
               (let ((s (thing-at-point 'sexp)))
                 (not (and s (assoc s cdlatex-command-alist-comb)))))
      (call-interactively #'org-table-next-field)
      t))

  (defun lazytab-org-table-next-field-maybe ()
    (interactive)
    (if (bound-and-true-p cdlatex-mode)
        (cdlatex-tab)
      (org-table-next-field))))
;; Snippets
;; Function that tries to autoexpand YaSnippets
;; The double quoting is NOT a typo!
;; (defun my/yas-try-expanding-auto-snippets ()
;;   (when (bound-and-true-p 'yas-minor-mode)
;;       (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
;;         (yas-expand))))

;; Try after every insertion
;; (add-hook 'post-self-insert-hook #'my/yas-try-expanding-auto-snippets)


;; Enable the www ligature in every possible major mode
;; Mover a otro path, causa problemas no abre emacs
;; (use-package ligature
;;   :load-path "/home/luisbarrera/.emacs.d/lisp/ligature.el"
;;   :config
;;     (ligature-set-ligatures 't '("www"))
;;     (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
;;     ;; Enable ligatures in programming modes
;;     (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
;;                                      ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
;;                                      "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
;;                                      "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
;;                                      "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
;;                                      "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
;;                                      "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
;;                                      "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
;;                                      "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
;;                                      "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))
;;     (global-ligature-mode 't))

(add-to-list 'load-path "~/.emacs.d/private/org-roam-ui")
(load-library "org-roam-ui")

;; Tabs en emacs
(use-package centaur-tabs
  :demand
  :config
  (setq centaur-tabs-style "bar"
        centaur-tabs-gray-out-icons 'buffer
        centaur-tabs-set-modified-marker t
        centaur-tabs-set-icons t
        centaur-tabs-adjust-buffer-order t
        centaur-tabs-label-fixed-length 10
        centaur-tabs-show-navigation-buttons t
        centaur-tabs-set-bar 'over)
  (centaur-tabs-enable-buffer-reordering)
  (centaur-tabs-mode t)
  (defun centaur-tabs-buffer-groups ()
    "`centaur-tabs-buffer-groups' control buffers' group rules.

 Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
 All buffer name start with * will group to \"Emacs\".
 Other buffer group by `centaur-tabs-get-group-name' with project name."
    (list
     (cond
	    ;; ((not (eq (file-remote-p (buffer-file-name)) nil))
	    ;; "Remote")
	    ((or (string-equal "*" (substring (buffer-name) 0 1))
	         (memq major-mode '(magit-process-mode
				                      magit-status-mode
				                      magit-diff-mode
				                      magit-log-mode
				                      magit-file-mode
				                      magit-blob-mode
				                      magit-blame-mode
				                      )))
	     "Emacs")
      ((string-match-p (concat "[0-9]\\{14\\}" ".*-.*\\.org") (buffer-name))
       "Roam")
	    ((derived-mode-p 'prog-mode)
	     "Editing")
	    ((derived-mode-p 'dired-mode)
	     "Dired")
	    ((memq major-mode '(helpful-mode
			                    help-mode))
	     "Help")
	    ((memq major-mode '(org-mode
			                    org-agenda-clockreport-mode
			                    org-src-mode
			                    org-agenda-mode
			                    org-beamer-mode
			                    org-indent-mode
			                    org-bullets-mode
			                    org-cdlatex-mode
			                    org-agenda-log-mode
			                    diary-mode))
	     "OrgMode")
	    (t
	     (centaur-tabs-get-group-name (current-buffer))))))
  :bind
  (:map evil-normal-state-map
	      ("g t" . centaur-tabs-forward)
	      ("g T" . centaur-tabs-backward))
  ("C-<left>" . centaur-tabs-forward-group)
  ("C-<right>" . centaur-tabs-backward-group)
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))
(defun centaur-tabs-hide-tab (x)
  "Do no to show buffer X in tabs."
  (let ((name (format "%s" x)))
    (or
     ;; Current window is not dedicated window.
     (window-dedicated-p (selected-window))

     ;; Buffer name not match below blacklist.
     (string-prefix-p "*epc" name)
     (string-prefix-p "*helm" name)
     (string-prefix-p "*Helm" name)
     (string-prefix-p "*Compile-Log*" name)
     (string-prefix-p "*lsp" name)
     (string-prefix-p "*company" name)
     (string-prefix-p "*Flycheck" name)
     (string-prefix-p "*tramp" name)
     (string-prefix-p " *Mini" name)
     (string-prefix-p "*help" name)
     (string-prefix-p "*straight" name)
     (string-prefix-p " *temp" name)
     (string-prefix-p "*Help" name)
     ;; (string-match-p (concat "[0-9]\\{14\\}" ".*-.*\\.org") name)

     ;; Is not magit buffer.
     (and (string-prefix-p "magit" name)
	        (not (file-name-extension name)))
     )))

;; Colúmna de números de línea relativos
(use-package linum-relative
  :config
  (setq linum-relative-backend 'display-line-numbers-mode)
  (linum-relative-mode t))

;; Mover palabras, linea, lineas o regiones usando M-<flechas>
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

;; Guardar un historial de undo
(use-package undo-fu-session
  :config
  (setq undo-fu-session-incompatible-files '("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'")))
(global-undo-fu-session-mode)

;; Ver el contenido del kill-ring, es decir el portapapeles interno de Emacs
;;  Keymap para activarlo es =M-"=
(use-package browse-kill-ring
  :bind ("C-\"" . browse-kill-ring))

;; Indentación más fuerte
(global-aggressive-indent-mode 1)
;;(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;; git-diff
(global-diff-hl-mode)

;; Indent guides
(add-hook 'prog-mode-hook 'indent-guide-mode)
(add-hook 'text-mode-hook (indent-guide-mode 'nil))
(add-hook 'org-mode-hook (indent-guide-mode 'nil))

;; Python
(elpy-enable)
;; Use IPython for REPL
;; Para hacer clear de la terminal =C-c M-o=
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

;; Haskell

;; Manejo de ventanas
;; (use-package edwina
;;   :ensure t
;;   :config
;;   ; (setq display-buffer-base-action '(display-buffer-below-selected))
;;   ; (edwina-setup-dwm-keys)
;;   (edwina-mode 1))

;; Lineas horizontales bonitas
(global-page-break-lines-mode)

;; Página inicial
;; (use-package dashboard
;;   :ensure t
;;   :hook (after-init . (desktop-read "/home/luisbarrera/.emacs.d/.emacs.desktop"))
;;   :config
;;   (dashboard-setup-startup-hook))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; Soporte para tabnine
(use-package company-tabnine :ensure t)
(add-to-list 'company-backends #'company-tabnine)

;; Company
;; Seleccionar la opción de company con M-1 M-2 ...
(setq company-show-numbers t)

;; Workgroups
;; Guardar los layouts en disco
(use-package workgroups2
  :ensure t
  :config
  (workgroups-mode 1)
  (setq wg-prefix-key (kbd "C-c w"))
  (setq wg-session-file "/home/luisbarrera/.emacs.d/workgroups.emacs"))
;; (org-agenda-list)
;; -----------------
;; Termina config de packages
;; -----------------

;; Desactivar centaur-tabs en frames que tengan más de 1 window abierto
;; (remove-hook 'window-configuration-change-hook 'my-disable-tabs-fun)
(add-hook 'window-configuration-change-hook 'my-disable-tabs-func)
(defun my-disable-tabs-func ()
  (interactive)
  (if (eql (length (window-list)) 1)
      (centaur-tabs-local-mode 0)
    (centaur-tabs-local-mode)))
;; (setq centaur-tabs-local-mode t) #'centaur-tabs-local-mode))
;; 'centaur-tabs-local-mode (setq centaur-tabs-local-mode t)))
;; (remove-hook 'window-configuration-change-hook 'centaur-tabs-local-mode)

;; Guardar el layout de las ventanas internas dentro de un frame de Emacs
;; Con C-[<left>|<right>] ciclas entre los layouts guardados.
(winner-mode 1)

;; Indentación
;; Se recomienda usar también los comando tabify y untabify
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Mostrar espacios en blanco, para limpiar todos los espacios en blanco innecesarios de una usar whitespace-cleanup
(setq-default show-trailing-whitespace t)
