;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

; Fonts
(setq doom-font (font-spec :family "JetBrains Mono" :size 17)
      doom-big-font (font-spec :family "JetBrains Mono" :size 17)
      doom-serif-font (font-spec :family "JetBrains Mono" :size 17)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 17))

; Split behaviour Always right & below and ask for buffer choice
(setq evil-vsplit-window-right t
      evil-split-window-below t)
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))

; Trash, revert, undo, scroll
(setq delete-by-moving-to-trash t
      trash-directory "~/.local/share/Trash/files/")
(global-auto-revert-mode 1)
(setq undo-limit 80000000
      evil-want-fine-undo t
      scroll-margin 2)

; Suppress confirm to exit messages
(setq confirm-kill-emacs nil)

; Initial buffer
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))
;
(setq initial-buffer-choice (lambda () (get-buffer-create "*scratch*")))
;; (setq initial-buffer-choice 'vterm)
(setq initial-scratch-message " ")
(setq initial-major-mode 'org-mode)
(global-set-key (kbd "C-c s") (lambda () (interactive) (switch-to-buffer "*scratch*")))

; Make markdown buffer easier
(evil-define-command +evil-buffer-markdown-new (_count file)
  "Creates a new markdown buffer replacing the current window, optionally
   editing a certain FILE"
  :repeat nil
  (interactive "P<f>")
  (if file
      (evil-edit file)
    (let ((buffer (generate-new-buffer "*new md*")))
      (set-window-buffer nil buffer)
      (with-current-buffer buffer
        (markdown-mode)
        (setq-local doom-real-buffer-p t)))))

(map! :leader
      (:prefix "n"
       :desc "New empty Markdown buffer" "M" #'+evil-buffer-markdown-new))

;; Org
;; NOTE: `org-directory' Must be set before org loads!
(setq org-directory "~/org/")
(setq org-roam-directory "~/org/roam/")
(setq org-roam-dailies-directory "~/org/roam/daily/")
; Org Mode
(after! org
(setq org-log-done 'time
      org-log-into-drawer t
      org-agenda-start-with-log-mode t
      org-log-reschedule 'time
      org-deadline-warning-days 0
      org-ellipsis " ▾ "
      org-hide-emphasis-markers t
      org-clock-into-drawer t)
(setq! org-todo-keywords
      '((sequence
         "TODO(t)"
         "DOING(a!)"
         "NEXT(n)"
         "WAITING(w!)"
         "GOAL(g)"
         "PROJECT(p)"
         "|"
         "DONE(d!)"
         "CANCELLED(c!)" )))
(setq! org-todo-keyword-faces
      '(("TODO" :foreground "#cc4d3e" :weight bold)
       ("DOING" :foreground "#1c7870" :weight bold)
       ("NEXT" :foreground "#ff7f50" :weight bold)
       ("WAITING" :foreground "#83898d" :weight bold)
       ("GOAL" :foreground "#cc4d3e" :weight bold)
       ("PROJECT" :foreground "#845bc8" :weight bold)
       ("DONE" :foreground "#2b8c63" :weight bold)
       ("CANCELLED" :foreground "#5d6265" :weight bold))))

; Function to clock in on DOING (NOTE: Don't think this is working)
(after! org
(defun org-clock-todo-change ()
  (if (string= org-state "DOING")
      (org-clock-in)
    (org-clock-out-if-current)))
;; https://www.philnewton.net/blog/automatic-org-keyword-changes/
;; Always change the task to DOING
(setq org-clock-in-switch-to-state "DOING")
;; Use a function to decide what to change the state to.
(setq org-clock-in-switch-to-state #'sodaware/switch-task-on-clock-start)
(defun sodaware/switch-task-on-clock-start (task-state)
  "Change a task to 'DOING' when TASK-STATE is 'TODO'."
  (if (string= task-state "TODO")
      "DOING"
      task-state))
)

; Org Priorities
(after! org
 (setq
    org-superstar-headline-bullets-list '("•" "•" "•" "•" "•"))
(setq org-superstar-prettify-item-bullets nil)
(after! org-fancy-priorities
  (setq
   org-fancy-priorities-list '("[A]" "[B]" "[C]")
   org-priority-faces
   '((?A :foreground "#cc4d3e" :weight bold)
     (?B :foreground "#1c7870" :weight bold)
     (?C :foreground "#5d6265" :weight bold))
   ))
)

; Org Capture Templates
(after! org
  (setq! org-capture-templates

        '(("n" " Next" entry (file+headline "~/org/todo.org" "NEXT:")
         "** TODO %? :p2:\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\")) \n")

           ("q" " Queued" entry (file+headline "~/org/todo.org" "QUEUED:")
            (file "~/org/tpl/tpl-todo.txt"))

           ("s" " Someday" entry (file "~/org/someday.org")
             (file "~/org/tpl/tpl-someday.txt") :empty-lines-before 1)

           ("d" "󰟶 Writing Inbox" entry (file+headline "~/org/drafts.org" "QUEUED:")
            "** TODO %?")

           ("g" " Goal" entry (file+headline "~/org/goals.org"
            "Capture") (file "~/org/tpl/tpl-goal.txt"))

           ("w" " Weekly Review" plain (file buffer-name)
            (file "~/org/tpl/tpl-weekly.txt") :empty-lines 1)
            )
           ))

;; Org Agenda Custom Commands
(setq org-agenda-custom-commands
 '(

   ("1" "High Priority"
    ((tags-todo "+p1-DONE-@someday"
           ((org-agenda-overriding-header "High Priority Todos"))
                )))

   ("2" "Medium Priority"
    ((tags-todo "+p2-DONE-@someday"
           ((org-agenda-overriding-header "Medium Priority Todos"))
                )))

   ("3" "Low Priority"
    ((tags-todo "+p3-DONE-@someday"
           ((org-agenda-overriding-header "Low Priority Todos"))
                )))

   ("h" "home"
    ((tags-todo "+home-DONE-p4-@someday-@goal"
           ((org-agenda-overriding-header "Domestic"))
           )))

   ("p" "sb"
    ((tags-todo "+sb-DONE-p4-@someday-@goal"
           ((org-agenda-overriding-header "Personal"))
           )))

   ("n" "na"
    ((tags-todo "+na-DONE-p4-@someday-@goal"
           ((org-agenda-overriding-header "Navigators"))
           )))

   ("r" "errand"
    ((tags-todo "+errand-DONE-p4-@someday-@goal"
           ((org-agenda-overriding-header "Errands"))
           )))

   ("w" "work"
    ((tags-todo "+work-DONE-p4-@someday-@goal"
           ((org-agenda-overriding-header "Work"))
           )))

   ("y" "sys"
    ((tags-todo "+sys-DONE-p4-@someday-@goal"
           ((org-agenda-overriding-header "System"))
           )))

   ("o" "Todo"
    ((todo "TODO"
           ((org-agenda-overriding-header "All Todos"))
           )))

   ("u" "Untagged"
    ((tags-todo "-@goal-@someday-{.*}")))

      ))

; Org tag alist
(after! org
  (setq org-tag-alist
        '(
             ("p1")
             ("p2")
             ("p3")
             ("p4")
             ("errand")
             ("home")
             ("na")
             ("sb")
             ("sys")
             ("work")
               ))
  (setq org-tag-alist-for-agenda
        '(
             ("p1")
             ("p2")
             ("p3")
             ("p4")
             ("errand")
             ("home")
             ("na")
             ("sb")
             ("sys")
             ("work")
               )))

;; Keybinds
;; Function to find files with keybind
(defun zz/add-file-keybinding (key file &optional desc)
  (let ((key key)
        (file file)
        (desc desc))
    (map! :desc (or desc file)
          key
          (lambda () (interactive) (find-file file)))))
(zz/add-file-keybinding "C-c d" "~/org/drafts.org" "drafts.org")
(zz/add-file-keybinding "C-c t" "~/org/todo.org" "todo.org")
;; (zz/add-file-keybinding "C-c w" "~/org/weekly.org" "weekly.org")
(global-set-key (kbd "C-c l") 'org-add-note)
(global-set-key (kbd "C-c n d") 'org-roam-dailies-goto-today)
;; (global-set-key (kbd "C-c d") 'org-roam-dailies-goto-today) ;; reset to drafts
(global-set-key (kbd "C-c n D") 'org-roam-dailies-goto-date)
(global-set-key (kbd "C-c n t") 'org-roam-dailies-goto-tomorrow)
(global-set-key (kbd "C-c n y") 'org-roam-dailies-goto-yesterday)
(global-set-key (kbd "C-c n f") 'org-roam-node-find)
(global-set-key (kbd "C-c n h") 'now)
(global-set-key (kbd "C-c n i") 'org-roam-node-insert)
(global-set-key (kbd "C-c n I") 'org-roam-node-insert-immediate)
(global-set-key (kbd "C-c n c") 'org-roam-capture)
(global-set-key (kbd "C-c n l") 'org-roam-buffer-toggle)
(global-set-key (kbd "C-c n j") 'org-roam-dailies-capture-today)
(global-set-key (kbd "C-c j") 'org-roam-dailies-capture-today)
(global-set-key (kbd "C-s") 'save-buffer)
;; (global-set-key (kbd "C-c n m") 'notmuch-search)
(global-set-key (kbd "C-c g") 'count-words)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map (kbd "C-c c") #'org-capture)
;; Switch between vterm buffer and previous
(global-set-key (kbd "C-c 0") (lambda ()
                              (interactive)
                              (if (string= (buffer-name) "*vterm*") (previous-buffer) (switch-to-buffer "*vterm*"))))
(global-set-key (kbd "C-c 9") (lambda ()
                              (interactive)
                              (if (string= (buffer-name) "*Org Agenda*") (previous-buffer) (switch-to-buffer "*Org Agenda*"))))
;; Dired go to fleeting notes
(global-set-key (kbd "C-c i") (lambda () (interactive) (dired "~/org/roam/fleeting")))
(global-set-key (kbd "C-c k") (lambda () (interactive) (dired "~/org/roam/projects")))
(global-set-key (kbd "C-c r") (lambda () (interactive) (dired "~/org/roam/reference")))
(global-set-key (kbd "C-c y") (lambda () (interactive) (dired "~/org/roam/daily")))
(global-set-key (kbd "C-c z") (lambda () (interactive) (dired "~/org/roam/zk")))
;; # Dired
(after! dired
(evil-define-key 'normal dired-mode-map
  (kbd "M-RET") 'dired-display-file
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-find-file ; use dired-find-file instead of dired-open.
  (kbd "m") 'dired-mark
  (kbd "t") 'dired-toggle-marks
  (kbd "u") 'dired-unmark
  (kbd "U") 'dired-unmark-all-marks
  (kbd "y") 'dired-do-copy
  (kbd "c") 'dired-create-empty-file
  (kbd "D") 'dired-do-delete
  (kbd "J") 'dired-goto-file
  (kbd "M") 'dired-do-chmod
  (kbd "R") 'dired-do-rename
  (kbd "T") 'dired-do-touch
  (kbd "Y") 'dired-copy-filename-as-kill ; copies filename to kill ring.
  (kbd "Z") 'dired-do-compress
  (kbd "C") 'dired-create-directory
  (kbd "-") 'dired-do-kill-lines
  (kbd "n") 'evil-search-next
  (kbd "N") 'evil-search-previous
  (kbd "q") 'kill-this-buffer
  ))
;; Dired less details
(defun my-dired-mode-setup ()
  "to be run as hook for `dired-mode'."
  (dired-hide-details-mode 1))

(add-hook 'dired-mode-hook 'my-dired-mode-setup)
;; Leader Keybinds
;; Easier key for terminal popup
(map! :leader
      :desc "Vterm toggle"
      "v" '+vterm/toggle)
;; Easier key for terminal full window
(map! :leader
      :desc "Vterm here"
      "V" '+vterm/here)
;; Writeroom increase text width
(map! :leader
      :desc "Writeroom increase width"
      "=" 'writeroom-increase-width)
;; Writeroom decrease text width
(map! :leader
      :desc "Writeroom increase width"
      "-" 'writeroom-decrease-width)
;; Consult find file
(map! :leader
      :desc "consult-find file"
      "/" 'consult-find)
;; Writeroom mode
(map! :leader
      :desc "writeroom-mode"
      "z" 'writeroom-mode)
;; rip grep
(map! :leader
      :desc "rgrep"
      "r" 'rgrep)
;; Quick org-tags-sparse-tags
(map! :leader
      (:prefix ("o" . "org-tags-sparse-tree")
                :desc "org-tags-sparse-tree" "s" #'org-tags-sparse-tree))
;; Quick org-agenda-filter
(map! :leader
      (:prefix ("o" . "org-agenda-filter")
                :desc "org-agenda-filter" "l" #'org-agenda-filter))
;; leader keys for org-roam-dailies
(map! :leader
      (:prefix ("n" . "org-roam-dailies-capture-today")
                :desc "org-roam-dailies-capture-today" "j" #'org-roam-dailies-capture-today))
(map! :leader
      (:prefix ("n" . "org-roam-dailies-goto-today")
                :desc "org-roam-dailies-goto-today" "d" #'org-roam-dailies-goto-today))
(map! :leader
      (:prefix ("n" . "now header")
                :desc "now header" "h" #'now))
(map! :leader
      (:prefix ("n" . "narrow markdown block")
               :desc "narrow markdown block" "b" #'markdown-narrow-to-block))
(map! :leader
      (:prefix ("n" . "org-roam-dailies-goto-yesterday")
                :desc "org-roam-dailies-goto-yesterday" "y" #'org-roam-dailies-goto-yesterday))
(map! :leader
      (:prefix ("n" . "Insert node immediate")
                :desc "Insert node immediate" "r I" #'org-roam-node-insert-immediate))
(map! :leader
      :desc "org-roam-dailies-goto-today"
      "d" #'org-roam-dailies-goto-today)
;; Evil write all buffers
(map! :leader
      (:prefix ("w" . "Write all buffers")
               :desc "Write all buffers" "a" 'evil-write-all))
;; Eval Buffer
(map! :leader
      (:prefix ("e" . "Eval")
               :desc "Eval buffer" "b" 'eval-buffer))
;; Focus Mode
(map! :leader
      (:prefix ("f")
               :desc "Focus Mode" "m" 'focus-mode))
;; avy search char in the open windows is kinda like qutebrowsers follow mode
(setq avy-all-windows t)
(map! :leader
      :prefix "j"
      :desc "avy-goto-char-timer" "j" #'avy-goto-char-timer)
;; org agenda week/day view (must be in agenda view)
(map! :leader
      :prefix "o"
      :desc "org-agenda-day-view" "1" #'org-agenda-day-view)
(map! :leader
      :prefix "o"
      :desc "org-agenda-week-view" "2" #'org-agenda-week-view)

;; Doom modeline
(after! doom-modeline
  (remove-hook 'doom-modeline-mode-hook #'size-indication-mode) ; filesize in modeline
  (remove-hook 'doom-modeline-mode-hook #'column-number-mode)   ; cursor column in modeline
  (line-number-mode -1)
  (setq doom-modeline-enable-word-count nil
        doom-modeline-percent-position nil
        display-time-format "%a %Y-%m-%d %H:%M"
        display-time-mode nil
        doom-modeline-height 15
        display-time-load-average nil
        display-time-default-load-average nil
        doom-modeline-icon t
        doom-modeline-major-mode-icon nil
        doom-modeline-major-color-icon nil
        doom-modeline-minor-modes nil
        doom-modeline-modal nil
        doom-modeline-modal-icon nil
        doom-modeline-buffer-encoding nil))

;; THEME
;; NOTE: The custom-set-faces get written to custom.el and may also need changing there.
(setq doom-theme 'doom-nord)
(custom-set-faces
  '(default ((t (:background "#0f0f0f"))))
  '(hl-line ((t (:extend t :background "#0f0f0f"))))
  '(mode-line ((t (:background "#0f0f0f"))))
  '(mode-line-inactive ((t (:background "#0f0f0f"))))
  '(region ((t (:extend t :background "#A98AAD" :foreground "#0f0f0f"))))
 )

;; Cursor colours
(setq
      evil-normal-state-cursor '(box "#88aaee")
      evil-insert-state-cursor '(bar "#88aaee")
      evil-visual-state-cursor '(hollow "#A98AAD"))
(after! solaire-mode
  (solaire-global-mode -1))

;; Writeroom Zen mode appearance
;; (add-hook 'writeroom-mode-hook (lambda () (display-line-numbers-mode -1)))
(setq writeroom-mode-line t
      writeroom-width 110
      +zen-text-scale 0.1)

;; Org roam
(setq org-roam-db-autosync-mode t
      org-roam-db-update-method 'immediate
      org-id-method 'ts
      org-roam-completion-everywhere t)
(setq org-roam-capture-templates
      '(("f" "󰟷 Fleeting" plain
         "%?"
         :if-new (file+head "fleeting/${title}.org" "#+title: ${title}\n#+filetags: fleeting\n#+options: toc:nil num:nil author:nil\n")
         :immediate-finish t
         :unnarrowed t)
        ("r" " Reference" plain "%?"
         :if-new
         (file+head "reference/${title}.org" "#+title: ${title}\n#+filetags: reference\n#+options: toc:nil num:nil author:nil\n")
         :immediate-finish t
         :unnarrowed t)
        ("z" " Zettel" plain "%?"
         :if-new
         (file+head "zk/${title}.org" "#+title: ${title}\n#+filetags: zk\n#+options: toc:nil num:nil author:nil\n")
         :immediate-finish t
         :unnarrowed t)
        ("p" " Project" plain "%?"
         :if-new
         (file+head "projects/${title}.org" "#+title: ${title}\n#+filetags: project\n#+options: toc:nil num:nil author:nil\n")
         :immediate-finish t
         :unnarrowed t)))

(setq org-roam-dailies-capture-templates
      '(("d" "default" entry "* %<%H:%M> %?"
         :if-new (file+head "%<%Y%m%d>.org" "#+title: %<%Y-%m-%d %A>\n#+options: toc:nil num:nil author:nil timestamp:nil\n")
         :empty-lines-before 1)))

;; This function from System Crafters allows you to make empty node/links to detail out later
(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

;; Org Roam UI
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; Elfeed
(require 'elfeed-org)
(after! elfeed
(elfeed-org)
(setq elfeed-search-filter "@1-week-ago +unread"
      elfeed-search-title-min-width 80
      elfeed-show-entry-switch #'pop-to-buffer
      shr-max-image-proportion 0.6)
(add-hook! 'elfeed-show-mode-hook (hide-mode-line-mode 1))
(add-hook! 'elfeed-search-update-hook #'hide-mode-line-mode)
 (defadvice! +rss-elfeed-wrap-h-nicer ()
    "Enhances an elfeed entry's readability by wrapping it to a width of
`fill-column' and centering it with `visual-fill-column-mode'."
    :override #'+rss-elfeed-wrap-h
    (setq-local truncate-lines nil
                shr-width 120
        ;        visual-fill-column-center-text t
                default-text-properties '(line-height 1.0))
    (let ((inhibit-read-only t)
          (inhibit-modification-hooks t))
 ;     (visual-fill-column-mode)
      (set-buffer-modified-p nil)))     )
;; browse article in gui browser instead of eww
(defun elfeed-show-visit-gui ()
  "Wrapper for elfeed-show-visit to use gui browser instead of eww"
  (interactive)
  (let ((browse-url-generic-program "xdg-open"))
    (elfeed-show-visit t)))
;; Note: The customize interface is also supported.
(setq rmh-elfeed-org-files (list "~/org/elfeed.org"))
(add-hook! 'elfeed-search-mode-hook #'elfeed-update)
(after! elfeed-search
  (set-evil-initial-state! 'elfeed-search-mode 'normal))
(after! elfeed-show-mode
  (set-evil-initial-state! 'elfeed-show-mode   'normal))
;;
(after! evil-snipe
  (push 'elfeed-show-mode   evil-snipe-disabled-modes)
  (push 'elfeed-search-mode evil-snipe-disabled-modes))
;;
;; Tecosaur keybinds modified
(map! :map elfeed-search-mode-map
      :after elfeed-search
      [remap kill-this-buffer] "q"
      [remap kill-buffer] "q"
      :n doom-leader-key nil
      :n "c" #'+rss/quit
      :n "e" #'elfeed-update
      :n "z" #'elfeed-search-untag-all-unread
      :n "u" #'elfeed-search-tag-all-unread
      :n "s" #'elfeed-search-live-filter
      :n "x" #'elfeed-search-show-entry
      :n "p" #'elfeed-show-pdf
      :n "+" #'elfeed-search-tag-all
      :n "-" #'elfeed-search-untag-all
      :n "S" #'elfeed-search-set-filter
      :n "b" #'elfeed-search-browse-url
      :n "y" #'elfeed-search-yank)
(map! :map elfeed-show-mode-map
      :after elfeed-show
      [remap kill-this-buffer] "q"
      [remap kill-buffer] "q"
      :n doom-leader-key nil
      :nm "c" #'+rss/delete-pane
      :nm "o" #'ace-link-elfeed
      :nm "RET" #'org-ref-elfeed-add
      :nm "n" #'elfeed-show-next
      :nm "N" #'elfeed-show-prev
      :nm "p" #'elfeed-show-pdf
      :nm "+" #'elfeed-show-tag
      :nm "-" #'elfeed-show-untag
      :nm "s" #'elfeed-show-new-live-search
      :nm "y" #'elfeed-show-yank)
;;
(evil-define-key 'normal elfeed-show-mode-map
  (kbd "J") 'elfeed-goodies/split-show-next
  (kbd "K") 'elfeed-goodies/split-show-prev)
(evil-define-key 'normal elfeed-search-mode-map
  (kbd "J") 'elfeed-goodies/split-show-next
  (kbd "K") 'elfeed-goodies/split-show-prev)

;; Rainbow mode
(add-hook! org-mode 'rainbow-mode)
(add-hook! prog-mode 'rainbow-mode)

;; Org Clock SFX
(setq org-clock-sound "~/sfx/advance_ding.wav")
(add-hook 'org-timer-done-hook 'org-clock-out)

;; Function to run my mail sync script (Not using currently)
;; (defun mail-sync-script ()
;;   "Run my custom shell script"
;;   (interactive)
;;   (call-process "~/.scripts/mail-sync.sh" nil 0))

;; (map! :leader
;;       :desc "mail sync script" "m s" #'mail-sync-script)

;; (defun notmuch-inbox-search ()
;;   "Search for emails with the tag:inbox using notmuch"
;;   (interactive)
;;   (notmuch-search "tag:inbox"))

;; (map! :leader
;;       :desc "Search inbox" "o i" #'notmuch-inbox-search)

;; Loads the pass package installed from MELPA
(use-package! pass)

;; org alert package
(use-package! org-alert
  :custom (alert-default-style 'libnotify)
  :config
  (setq org-alert-interval 1800
        org-alert-notify-cutoff 15
        org-alert-notification-title "Upcoming Task")
  (org-alert-enable))
;;
; nov (epub reader)
(use-package! nov
  :mode ("\\.epub\\'" . nov-mode)
  :config
  (map! :map nov-mode-map
        :n "RET" #'nov-scroll-up)

  (advice-add 'nov-render-title :override #'ignore)

  (defun +nov-mode-setup ()
    "Tweak nov-mode to our liking."
    (face-remap-add-relative 'variable-pitch
                             :family "Bookerly"
                             :height 1.0
                             :width 'semi-expanded)
    (face-remap-add-relative 'default :height 1.0)
    (variable-pitch-mode 1)
    (setq-local line-spacing 0.2
                next-screen-context-lines 4
                shr-use-colors nil
                nov-text-width 120)
    ;; (when (require 'visual-fill-column nil t)
    ;; (setq-local visual-fill-column-center-text t)
      ;;             visual-fill-column-width 64
      ;;             nov-text-width 106)
       (hl-line-mode -1)
      ;; (visual-fill-column-mode 1))
    ;; (when (featurep 'hl-line-mode)
    ;; Re-render with new display settings
    (nov-render-document)
    ;; Look up words with the dictionary.
    (add-to-list '+lookup-definition-functions #'+lookup/dictionary-definition))

  (add-hook 'nov-mode-hook #'+nov-mode-setup))

;; nov modeline
(after! doom-modeline
  (defvar doom-modeline-nov-title-max-length 20)
  (doom-modeline-def-segment nov-author
    (propertize
     (cdr (assoc 'creator nov-metadata))
     'face (doom-modeline-face 'doom-modeline-project-parent-dir)))
  (doom-modeline-def-segment nov-title
    (let ((title (or (cdr (assoc 'title nov-metadata)) "")))
      (if (<= (length title) doom-modeline-nov-title-max-length)
          (concat " " title)
        (propertize
         (concat " " (truncate-string-to-width title doom-modeline-nov-title-max-length nil nil t))
         'help-echo title))))
  (doom-modeline-def-segment nov-current-page
    (let ((words (count-words (point-min) (point-max))))
      (propertize
       (format " %d/%d"
               (1+ nov-documents-index)
               (length nov-documents))
       'face (doom-modeline-face 'doom-modeline-info)
       'help-echo (if (= words 1) "1 word in this chapter"
                    (format "%s words in this chapter" words)))))
  (doom-modeline-def-segment scroll-percentage-subtle
    (concat
     (doom-modeline-spc)
     (propertize (format-mode-line '("" doom-modeline-percent-position "%%"))
                 'face (doom-modeline-face 'shadow)
                 'help-echo "Buffer percentage")))

  (doom-modeline-def-modeline 'nov
    '(workspace-name window-number nov-author nov-title nov-current-page scroll-percentage-subtle)
    '(misc-info major-mode time))

  (add-to-list 'doom-modeline-mode-alist '(nov-mode . nov)))

;; Load other config files
(load! (concat doom-user-dir "private"))

;; Timestamp function
(defun now ()
 (interactive)
 (insert (format-time-string "* %H:%M" )
 ))

;; Online lookup provider list
(setq +lookup-provider-url-alist
      '(("Doom issues"       "https://github.com/hlissner/doom-emacs/issues?q=is%%3Aissue+%s")
        ("Brave Search"      "https://search.brave.com/search?q")
        ("DuckDuckGo"        +lookup--online-backend-duckduckgo "https://duckduckgo.com/?q=%s")
        ("Github"            "https://github.com/search?ref=simplesearch&q=%s")
        ("StackOverflow"     "https://stackoverflow.com/search?q=%s")
        ("Youtube"           "https://youtube.com/results?aq=f&oq=&search_query=%s")
        ("Wikipedia"         "https://wikipedia.org/search-redirect.php?language=en&go=Go&search=%s")
        ("Arch Wiki"         "https://wiki.archlinux.org/index.php?search=%s&title=Special%3ASearch&wprov=acrw1")
        ("AUR"               "https://aur.archlinux.org/packages?O=0&K=%s")))

;; Escape insert mode with jk kj
(setq evil-escape-unordered-key-sequence t)

;; Line numbers with exceptions
(setq display-line-numbers-type 'relative)
(dolist (mode '(org-mode-hook
                markdown-mode-hook
                vterm-mode-hook
                shell-mode-hook))
 (add-hook mode (lambda () (display-line-numbers-mode 0))))

;;When connecting with emacsclient -nc, don't open a new workspace. Simply connect to "main"
(after! persp-mode
  (setq persp-emacsclient-init-frame-behaviour-override "main"))

;; highlight line mode
(setq hl-line-mode -1)
(setq global-hl-line-mode -1)

;; Disable smartparens (autopairs)
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

;; Transparency
(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))
;;
;;; config.el ends here
