;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; NOTE:This config is my non- evil setup and very much a work in progress

;; Fonts
(setq doom-font (font-spec :family "Aporetic Sans Mono" :size 17)
      doom-big-font (font-spec :family "Aporetic Sans Mono" :size 19)
      doom-serif-font (font-spec :family "Aporetic Serif Mono" :size 17)
      doom-variable-pitch-font (font-spec :family "Aporetic Serif" :size 17))

;; Light mode custom faces based off doom-one-light default theme
(setq doom-theme 'doom-one-light)
(custom-set-faces
  '(cursor ((t (:background "#232323"))))
  '(default ((t (:background "#efefef"))))
  '(font-lock-builtin-face ((t (:foreground "#E45B4F"))))
  '(diredfl-date-time ((t (:foreground "#adadad"))))
  '(diredfl-number ((t (:foreground "#adadad"))))
  '(hl-line ((t (:extend t :background "#dddddd"))))
  '(line-number ((t (:extend t :foreground "#adadad"))))
  '(mode-line ((t (:background "#c4c4c4"))))
  '(doom-themes-org-at-tag ((t (:foreground "#84888b"))))
  '(doom-modeline-project-dir ((t (:foreground "#0f0f0f"))))
  '(doom-modeline-buffer-path ((t (:foreground "#0f0f0f"))))
  '(doom-modeline-buffer-modified ((t (:foreground "#666666" :weight bold))))
  '(doom-modeline-notification ((t (:foreground "#666666"))))
  '(doom-modeline-panel ((t (:foreground "#666666"))))
  '(doom-modeline-warning ((t (:foreground "#666666"))))
  '(doom-modeline-emphasis ((t (:foreground "#666666"))))
  '(doom-modeline-buffer-major-mode ((t (:foreground "#666666"))))
  '(doom-modeline-info ((t (:foreground "#666666"))))
  '(doom-modeline-fly-insert-state ((t (:foreground "#666666"))))
  '(doom-modeline-urgent ((t (:foreground "#666666"))))
  '(doom-modeline-bar ((t (:background "#666666"))))
  '(highlight ((t (:background "#c4c4c4"))))
  '(header-line ((t (:background "#efefef" :forground "#0f0f0f" :weight bold :height 1.2))))
  '(markdown-metadata-value-face ((t (:foreground "#666666"))))
  '(markdown-url-face ((t (:foreground "#adadad"))))
  '(markdown-gfm-checkbox-face ((t (:foreground "#adadad"))))
  '(markdown-bold-face ((t (:foreground "#000000"))))
  '(markdown-italic-face ((t (:foreground "#0f0f0f"))))
  '(markdown-list-face ((t (:foreground "#adadad"))))
  '(mu4e-header-key-face ((t (:foreground "#666666"))))
  '(mu4e-modeline-face ((t (:foreground "#666666"))))
  '(mu4e-unread-face ((t (:foreground "#666666"))))
  '(mode-line-inactive ((t (:background "#c4c4c4" :foreground "#adadad"))))
  '(org-agenda-clocking ((t (:background "#c4c4c4")))) ;;NOTE: not working
  '(org-agenda-date-today ((t (:foreground "#0f0f0f"))))
  '(org-agenda-done ((t (:foreground "#adadad"))))
  '(org-headline-done ((t (:foreground "#adadad"))))
  '(region ((t (:extend t :background "#ecc9c6"))))
  '(org-ellipsis ((t (:foreground "#666666" :background "#efefef"))))
  '(org-level-1 ((t (:foreground "#383a42" :height 1.1))))
  '(org-level-2 ((t (:foreground "#383a42" :height 1.0))))
  '(org-level-3 ((t (:foreground "#383a42" :height 1.0))))
  '(org-level-4 ((t (:foreground "#383a42" :height 1.0))))
  '(org-level-5 ((t (:foreground "#383a42" :height 1.0))))
  '(org-level-6 ((t (:foreground "#383a42" :height 1.0))))
  '(org-level-7 ((t (:foreground "#383a42" :height 1.0))))
  '(org-level-8 ((t (:foreground "#383a42" :height 1.0))))
  '(org-document-title ((t (,@headline ,@variable-tuple :foreground "#0f0f0f" :height 1.35 :underline nil))))
  '(org-checkbox ((t (:foreground "#adadad"))))
  '(org-list-dt ((t (:foreground "#adadad"))))
  '(org-checkbox-statistics-todo ((t (:foreground "#E45B4F"))))
  '(org-checkbox-statistics-done ((t (:foreground "#2b8c63"))))
  '(org-tag ((t (:inherit (shadow fixed-pitch) :weight light :height 0.9))))
  '(org-scheduled-previously ((t (:foreground "#d1a07d"))))
  '(org-scheduled-today ((t (:foreground "#2b8c63"))))
  '(org-warning ((t (:foreground "#d1a07d"))))
  '(org-date ((t (:foreground "#adadad"))))
  '(org-agenda-clocking ((t (:background "#0f0f0f"))))
  '(markdown-header-face-1 ((t (:foreground "#0f0f0f" :height 1.25))))
  '(markdown-header-face-2 ((t (:foreground "#0f0f0f" :height 1.2))))
  '(markdown-header-face-3 ((t (:foreground "#0f0f0f" :height 1.15))))
  '(markdown-header-face-4 ((t (:foreground "#0f0f0f" :height 1.1))))
  '(markdown-header-face-5 ((t (:foreground "#0f0f0f" :height 1.1))))
  '(secondary-selection ((t (:background "#dddddd"))))
 )

;; Bolds & Italic if theme allows it
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

;; Org mode documents are always centred
(add-hook 'org-mode-hook 'writeroom-mode)

;; Avoid spacing issues? source: https://sophiebos.io/posts/beautifying-emacs-org-mode/
(require 'org-indent)
(set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))

;; Disabling solaire-mode neccessary for consistent custom background colour
(after! solaire-mode
  (solaire-global-mode -1))

;; Initial buffer
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))
(setq initial-buffer-choice (lambda () (get-buffer-create "*scratch*")))
(setq initial-scratch-message " ")
(setq initial-major-mode 'lisp-mode)

;; Split behaviour (Always right & below and consult  for buffer choice) NOTE: Causing issue with magit
;; (defadvice! prompt-for-buffer-after-split (&rest _)
;;   :after '(split-window-below split-window-right)
;;   (consult-buffer))

;; Increase line spacing
(setq-default line-spacing 2)

;; Trash, revert, undo, scroll
(setq delete-by-moving-to-trash t
      trash-directory "~/.local/share/Trash/files/")
(global-auto-revert-mode 1)
(setq undo-limit 80000000
      scroll-margin 2)

;; Org mode
;; NOTE: `org-directory' Must be set before org loads!
(setq org-directory "~/org/")
(setq org-roam-directory "~/org/roam/")
(setq org-roam-dailies-directory "~/org/")
(after! org
(setq org-log-done 'time
      org-agenda-span 'day
      org-agenda-start-on-weekday nil
      org-agenda-start-day nil
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
         "STRT(s!)"
         "WAIT(w!)"
         "PROJ(p)"
         "|"
         "DONE(d!)"
         "CANC(c!)" )))
(setq! org-todo-keyword-faces
      '(("TODO" :foreground "#cc4d3e" :weight bold)
       ("STRT" :foreground "#85C7A1" :weight bold)
       ("WAIT" :foreground "#83898d" :weight bold)
       ("PROJ" :foreground "#896ccc" :weight bold)
       ("DONE" :foreground "#2b8c63" :weight bold)
       ("CANC" :foreground "#5d6265" :weight bold)))
)

;; Org Bullets and Priorities
(after! org
  (setq org-superstar-headline-bullets-list '("•" "•" "•" "•" "•" "•"))
  (setq org-superstar-prettify-item-bullets nil)
  (after! org-fancy-priorities
  (setq
   org-fancy-priorities-list '("[A]" "[B]" "[C]")
   org-priority-faces
   '((?A :foreground "#cc4d3e" :weight bold)
     (?B :foreground "#ff7f50" :weight bold)
     (?C :foreground "#d1a07d" :weight bold))
   ))
)

;; Org Capture Templates
(after! org
  (setq! org-capture-templates
        '(
          ("t" " Todo")
          ("tp" "󰭕 Personal" entry (file+headline "~/org/per.org" "INBOX:")
            (file "~/org/tpl/tpl-todo.txt"))

           ("tn" " NA" entry (file+headline "~/org/na.org" "INBOX:")
            (file "~/org/tpl/tpl-todo.txt"))

           ("tw" " Work" entry (file+headline "~/org/work.org" "INBOX:")
            (file "~/org/tpl/tpl-todo.txt"))

           ("td" " Done" entry (file "~/org/archive.org")
             (file "~/org/tpl/tpl-done.txt"))

           ("e" " Event" entry (file "~/org/events.org")
             "* %? \n %^t")

           ("l" " Log" plain (file "~/org/log.org")
            (file "~/org/tpl/tpl-default.txt"))

           ("p" "󰢧 Plan")
           ("pd" "󰃶 Daily Plan" plain (file "~/org/log.org")
            (file "~/org/tpl/tpl-bod.txt"))

           ("pr" "󰱄 Daily Review" plain (file "~/org/log.org")
            (file "~/org/tpl/tpl-eod.txt"))

           ("pw" "󱛡 Weekly Review" plain (file "~/org/log.org")
            (file "~/org/tpl/tpl-weekly.txt"))

          ("w" " Watch")
           ("wt" "󰿎 To Watch" entry (file+headline "~/org/watch.org" "TO WATCH:")
            (file "~/org/tpl/tpl-towatch.txt"))

           ("wd" "󰎁 Watched" entry (file+headline "~/org/watch.org" "WATCHED:")
            (file "~/org/tpl/tpl-watched.txt") :prepend t)
            )
           ))

;; Org Agenda Custom Commands
(setq org-agenda-custom-commands
 '(("f" "+fleeting"
    ((tags "+fleeting"
           ((org-agenda-overriding-header "Fleeting"))
           )))

   ("i" "+@inbox"
    ((tags-todo "+@inbox"
           ((org-agenda-overriding-header "@inbox"))
           )))

   ("u" "Untagged"
    ((tags-todo "-goal-someday-{.*}")))
           ))

;; Org tag-alist
(after! org
  (setq org-tag-alist
        '(
             ("@art")
             ("@call")
             ("@email")
             ("@errand")
             ("@games")
             ("@home")
             ("@listen")
             ("@post")
             ("@read")
             ("@research")
             ("@sys")
             ("@watch")
             ("@web")
             ("@per")
             ("@na")
             ("@work")
             ("fleeting")
             ("posted")
             ("@inbox")
             ("@recur")
               ))
  (setq org-tag-alist-for-agenda
        '(
             ("@art")
             ("@call")
             ("@email")
             ("@errand")
             ("@games")
             ("@home")
             ("@listen")
             ("@post")
             ("@read")
             ("@research")
             ("@sys")
             ("@watch")
             ("@web")
             ("@per")
             ("@na")
             ("@work")
             ("fleeting")
             ("posted")
             ("@inbox")
             ("@recur")
               )))

;; Keybinds
(defun jethro/org-capture-inbox ()
  (interactive)
  (org-roam-dailies-capture-today))
  ;; (org-capture nil "i"))

(defun jethro/org-agenda ()
  (interactive)
  (org-agenda nil "a"))

(bind-key "<f6>" #'org-capture)
(bind-key "C-c SPC" #'jethro/org-capture-inbox)
(bind-key "C-c <tab>" #'jethro/org-agenda)

;; Rainer Konig copy org id link
(defun my/copy-idlink-to-clipboard() "Copy an ID link with the
headline to killring, if no ID create a new unique
ID. This function works only in an 'org-mode' or 'org-agenda' buffer.

The purpose of this function is to easily construct id:-links to
'org-mode' items. If assigned to a key it saves you marking the
text and copying to the killring."
       (interactive)
       (when (eq major-mode 'org-agenda-mode) ;switch to orgmode
     (org-agenda-show)
     (org-agenda-goto))
       (when (eq major-mode 'org-mode) ; do this only in org-mode buffers
     (setq mytmphead (nth 4 (org-heading-components)))
         (setq mytmpid (funcall 'org-id-get-create))
     (setq mytmplink (format "[[id:%s][%s]]" mytmpid mytmphead))
     (kill-new mytmplink)
     (message "Copied %s to killring (clipboard)" mytmplink)
       ))

(global-set-key (kbd "<f5>") 'my/copy-idlink-to-clipboard)

;; Function to find files with keybind
(defun zz/add-file-keybinding (key file &optional desc)
  (let ((key key)
        (file file)
        (desc desc))
    (map! :desc (or desc file)
          key
          (lambda () (interactive) (find-file file)))))
(zz/add-file-keybinding "C-c t t" "~/org/per.org" "per.org")
(zz/add-file-keybinding "C-c t y" "~/org/work.org" "work.org")
(zz/add-file-keybinding "C-c t u" "~/org/na.org" "na.org")
(global-set-key (kbd "C-c l") 'org-add-note)
(global-set-key (kbd "C-c d") 'org-roam-dailies-goto-today)
(global-set-key (kbd "C-c D") 'org-roam-dailies-goto-date)
(global-set-key (kbd "C-c T") 'org-roam-dailies-goto-tomorrow)
(global-set-key (kbd "C-c Y") 'org-roam-dailies-goto-yesterday)
(global-set-key (kbd "C-c o n") 'org-roam-node-find)
(global-set-key (kbd "C-c o i") 'org-roam-node-insert)
(global-set-key (kbd "C-c o I") 'org-roam-node-insert-immediate)
(global-set-key (kbd "C-c r") 'org-roam-capture)
(global-set-key (kbd "C-c j") 'org-roam-dailies-capture-today)
(global-set-key (kbd "C-c g") 'count-words)
(global-set-key (kbd "C-c o a") 'org-agenda)
(global-set-key (kbd "C-c o c") #'org-capture)

;; Switch back and forth between some commonly used
(global-set-key (kbd "C-c 0") (lambda ()
                               (interactive)
                               (if (string= (buffer-name) "*vterm*") (previous-buffer) (switch-to-buffer "*vterm*"))))
(global-set-key (kbd "C-c 9") (lambda ()
                               (interactive)
                               (if (string= (buffer-name) "*Org Agenda*") (previous-buffer) (switch-to-buffer "*Org Agenda*"))))
(global-set-key (kbd "C-c 8") (lambda ()
                               (interactive)
                               (if (string= (buffer-name) "*eww*") (previous-buffer) (switch-to-buffer "*eww*"))))

;; Keybinds
(global-set-key (kbd "C-c s c") (lambda () (interactive) (switch-to-buffer "*scratch*")))
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-c RET") 'consult-bookmark)
(global-set-key (kbd "C-c b m") 'bookmark-set)
(global-set-key (kbd "C-c b M") 'bookmark-delete)
(global-set-key (kbd "C-c m m") 'notmuch)
(global-set-key (kbd "C-x w m") 'doom/window-maximize-buffer)
(global-set-key (kbd "C-x w c") '+workspace/close-window-or-workspace)
(global-set-key (kbd "C-x w v") 'split-window-right)
(global-set-key (kbd "C-x w s") 'split-window-below)
(global-set-key (kbd "C-x w x") 'window-swap-states)
(global-set-key (kbd "C-c b n") 'next-buffer)
(global-set-key (kbd "C-c b i") 'ibuffer)
(global-set-key (kbd "C-c ,") 'ido-switch-buffer)
(global-set-key (kbd "C-c b p") 'previous-buffer)
(global-set-key (kbd "C-x k") 'doom/kill-this-buffer-in-all-windows)
(global-set-key (kbd "C-c k") 'doom/kill-this-buffer-in-all-windows)
(global-set-key (kbd "C-x w e") #'elfeed)

;; Avy
(setq avy-all-windows t)
(global-set-key (kbd "C-;") #'avy-goto-char-timer)

;; Functions and keybinds for notmuch searches
(defun notmuch-inbox-search ()
  (interactive)
  (notmuch-search "tag:inbox"))
(global-set-key (kbd "C-c m i") #'notmuch-inbox-search)

;; Notmuch search flagged
(defun notmuch-flagged-search ()
  (interactive)
  (notmuch-search "tag:flagged"))
(global-set-key (kbd "C-c m f") #'notmuch-flagged-search)

;; Notmuch search unread
(defun notmuch-unread-search ()
  (interactive)
  (notmuch-search "tag:unread"))
(global-set-key (kbd "C-c m u") #'notmuch-unread-search)

;;  TODO: Commented code below  still needs adapting for non-evil
 ;; (after! dired
;; (evil-define-key 'normal dired-mode-map
;;   (kbd "M-RET") 'dired-display-file
;;   (kbd "h") 'dired-up-directory
;;   (kbd "l") 'dired-find-file ; use dired-find-file instead of dired-open.
;;   (kbd "m") 'dired-mark
;;   (kbd "t") 'dired-toggle-marks
;;   (kbd "u") 'dired-unmark
;;   (kbd "U") 'dired-unmark-all-marks
;;   (kbd "y") 'dired-do-copy
;;   (kbd "c") 'dired-create-empty-file
;;   (kbd "D") 'dired-do-delete
;;   (kbd "J") 'dired-goto-file
;;   (kbd "M") 'dired-do-chmod
;;   (kbd "R") 'dired-do-rename
;;   (kbd "T") 'dired-do-touch
;;   (kbd "Y") 'dired-copy-filename-as-kill ; copies filename to kill ring.
;;   (kbd "Z") 'dired-do-compress
;;   (kbd "C") 'dired-create-directory
;;   (kbd "-") 'dired-do-kill-lines
;;   (kbd "n") 'evil-search-next
;;   (kbd "N") 'evil-search-previous
;;   (kbd "q") 'kill-this-buffer
;;   ))

;; Leader Keybinds
; Easier key for terminal popup
;; (map! :leader
;;       :desc "Vterm toggle"
;;       "v" '+vterm/toggle)
;; ; Easier key for terminal full window
;; (map! :leader
;;       :desc "Vterm here"
;;       "V" '+vterm/here)
;; ; Writeroom mode
;; (map! :leader
;;       :desc "writeroom-mode"
;;       "z" 'writeroom-mode)
;; ;; ; Writeroom increase text width
;; (map! :leader
;;       :desc "Writeroom increase width"
;;       "=" 'writeroom-increase-width)
;; ; Writeroom decrease text width
;; (map! :leader
;;       :desc "Writeroom increase width"
;;       "-" 'writeroom-decrease-width)
;; ; Consult find file
;; (map! :leader
;;       :desc "consult-find file"
;;       "/" 'consult-find)
;; ; rip grep
;; (map! :leader
;;       :desc "rgrep"
;;       "r" 'rgrep)
;; ; Quick org-tags-sparse-tags
;; (map! :leader
;;       (:prefix ("o" . "org-tags-sparse-tree")
;;                 :desc "org-tags-sparse-tree" "s" #'org-tags-sparse-tree))
;; ; Quick org-agenda-filter
;; (map! :leader
;;       (:prefix ("o" . "org-agenda-filter")
;;                 :desc "org-agenda-filter" "l" #'org-agenda-filter))
;; (map! :leader
;;       (:prefix ("n" . "narrow markdown block")
;;                :desc "narrow markdown block" "b" #'markdown-narrow-to-block))
;; ;; Leader e
;; (map! : leader
;;       (:prefix ("e" . "Eval")
;;                :desc "Eval buffer" "b" 'eval-buffer))
;; (map! :leader
;;       (:prefix ("e" . "Eval")
;;                :desc "Eval buffer" "r" 'eval-region))
;; (map! :leader
;;       (:prefix ("e" . "eww")
;;                :desc "eww" "w" 'eww))
;; Minimal Doom modeline
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

;; Writeroom Zen mode appearance
(setq writeroom-mode-line t
      writeroom-width 120
      +zen-text-scale 0.1)

;; Org roam
(setq org-roam-db-autosync-mode t
      org-roam-db-update-method 'immediate
      org-id-method 'ts
      org-roam-completion-everywhere t)
(setq org-roam-capture-templates
      '(("r" " Reference" plain "%?"
         :if-new
         (file+head "reference/${title}.org" "#+title: ${title}\n#+filetags: reference\n#+options: toc:nil num:nil author:nil\n")
         :immediate-finish t
         :unnarrowed t)
        ("f" "󰟷 Fleeting" plain "%?"
         :if-new
         (file+head "fleeting/%<%Y%m%d%H%M>${slug}.org" "#+title: %<%Y%m%d%H%M>\n#+filetags: fleeting\n#+options: toc:nil num:nil author:nil\n")
         :immediate-finish t
         :unnarrowed t)
        ("p" " Permanent" plain "%?"
         :if-new
         (file+head "zk/${title}.org" "#+title: ${title}\n#+filetags: zk\n#+options: toc:nil num:nil author:nil\n")
         :immediate-finish t
         :unnarrowed t)
        ("a" "󰧮 Article" plain "%?"
         :if-new
         (file+head "articles/${title}.org" "#+title: ${title}\n#+filetags: :article:draft:\n#+options: toc:nil num:nil author:nil\n")
         :immediate-finish t
         :unnarrowed t))
        )

; Org roam dailies capture template
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :target (file+datetree "log.org" week)))
      )

;; This function from System Crafters allows you insert empty node/links to detail out later
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
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; Elfeed
(require 'elfeed-org)
(after! elfeed
(elfeed-org)
(setq elfeed-search-filter "@1-day-ago +unread"
      elfeed-search-title-min-width 80
      elfeed-show-entry-switch #'pop-to-buffer
      shr-max-image-proportion 0.6)
(add-hook! 'elfeed-show-mode-hook (hide-mode-line-mode 1))
(add-hook! 'elfeed-search-update-hook #'hide-mode-line-mode)
;; Tecosaur elfeed settings
 (defadvice! +rss-elfeed-wrap-h-nicer ()
    "Enhances an elfeed entry's readability by wrapping it to a width of
`fill-column' and centering it with `visual-fill-column-mode'."
    :override #'+rss-elfeed-wrap-h
    (setq-local truncate-lines nil
                shr-width 120
                visual-fill-column-center-text t
                default-text-properties '(line-height 0.8))
    (let ((inhibit-read-only t)
          (inhibit-modification-hooks t))
     (writeroom-mode)
      (set-buffer-modified-p nil)))     )

(setq rmh-elfeed-org-files (list "~/org/elfeed.org"))
(add-hook! 'elfeed-search-mode-hook #'elfeed-update)

;;  Default browser
;; (setq browse-url-browser-function 'eww-browse-url)
(setq browse-url-browser-function 'browse-url-xdg-open)

;; Rainbow mode
(add-hook! org-mode 'rainbow-mode)
(add-hook! prog-mode 'rainbow-mode)

;; Org Clock SFX
(setq org-clock-sound "~/sfx/advance_ding.wav")
(add-hook 'org-timer-done-hook 'org-clock-out)

;; Loads the pass package installed from MELPA
(use-package! pass)

;; Org alert package
(use-package! org-alert
  :custom (alert-default-style 'libnotify)
  :config
  (setq org-alert-interval 1800
        org-alert-notify-cutoff 15
        org-alert-notify-after-event-cutoff 60
        org-alert-notification-title "Upcoming Task")
  (org-alert-enable))

;; Nov epub reader (from Tecosaur modifed)
(use-package! nov
  :mode ("\\.epub\\'" . nov-mode)
  :config
  (map! :map nov-mode-map
        :n "J" #'nov-scroll-up)

  (advice-add 'nov-render-title :override #'ignore)

  (defun +nov-mode-setup ()
    (writeroom-mode 1)
    (setq-local line-spacing 0.2
                next-screen-context-lines 4
                shr-use-colors nil
                writeroom-width 126
                nov-text-width 126)
    (hl-line-mode -1)
;; Re-render with new display settings
    (nov-render-document)
;; Look up words with the dictionary.
    (add-to-list '+lookup-definition-functions #'+lookup/dictionary-definition))
    (add-hook 'nov-mode-hook #'+nov-mode-setup))

;; Nov modeline (from Tecosaur modified)
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
    '(nov-title nov-current-page scroll-percentage-subtle)
    '(misc-info major-mode time))

  (add-to-list 'doom-modeline-mode-alist '(nov-mode . nov)))

;; Timestamp function
(defun now ()
 (interactive)
 (insert (format-time-string "**** %H:%M" )
 ))

;; Online lookup search provider list
(setq +lookup-provider-url-alist
      '(("Doom issues"       "https://github.com/hlissner/doom-emacs/issues?q=is%%3Aissue+%s")
        ("Brave Search"      "https://search.brave.com/search?q")
        ("DuckDuckGo"        +lookup--online-backend-duckduckgo "https://duckduckgo.com/?q=%s")
        ("Github"            "https://github.com/search?ref=simplesearch&q=%s")
        ("Wikipedia"         "https://wikipedia.org/search-redirect.php?language=en&go=Go&search=%s")
        ("Arch Wiki"         "https://wiki.archlinux.org/index.php?search=%s&title=Special%3ASearch&wprov=acrw1")
        ("AUR"               "https://aur.archlinux.org/packages?O=0&K=%s")))

;; Line numbers with exceptions for certain modes
(setq global-display-line-numbers-mode t
      display-line-numbers-type 'normal)
(dolist (mode '(org-mode-hook
                text-mode-hook
                markdown-mode-hook
                mu4e-compose-mode-hook
                vterm-mode-hook
                term-mode-hook
                shell-mode-hook))
 (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; When connecting with emacsclient -nc, don't open a new workspace, connect to "main"
(after! persp-mode
  (setq persp-emacsclient-init-frame-behaviour-override "main"))

;; Highlight line mode
(add-hook 'text-mode-hook (lambda () (hl-line-mode -1)))

;; Disable long minibuffer messages about place in outline in org-mode
(add-hook 'org-mode-hook (lambda () (eldoc-mode nil)))

;; Disable smartparens (autopairs)
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

;; Suppress confirm to exit messages
(setq confirm-kill-emacs nil)

;; Prot: Run commands in a popup frame
;; NOTE: strange font size with more than one workspace active
;; See: https://protesilaos.com/codelog/2024-09-19-emacs-command-popup-frame-emacsclient/
(defun prot-window-delete-popup-frame (&rest _)
  "Kill selected selected frame if it has parameter `prot-window-popup-frame'.
Use this function via a hook."
  (when (frame-parameter nil 'prot-window-popup-frame)
    (delete-frame)))

(defmacro prot-window-define-with-popup-frame (command)
  "Define interactive function which calls COMMAND in a new frame.
Make the new frame have the `prot-window-popup-frame' parameter."
  `(defun ,(intern (format "prot-window-popup-%s" command)) ()
     ,(format "Run `%s' in a popup frame with `prot-window-popup-frame' parameter.
Also see `prot-window-delete-popup-frame'." command)
     (interactive)
     (let ((frame (make-frame '((prot-window-popup-frame . t)))))
       (select-frame frame)
       (switch-to-buffer " prot-window-hidden-buffer-for-popup-frame")
       (condition-case nil
           (call-interactively ',command)
         ((quit error user-error)
          (delete-frame frame))))))

(declare-function org-capture "org-capture" (&optional goto keys))
(defvar org-capture-after-finalize-hook)

;;;###autoload (autoload 'prot-window-popup-org-capture "prot-window")
(prot-window-define-with-popup-frame org-capture)

(add-hook 'org-capture-after-finalize-hook #'prot-window-delete-popup-frame)

;; Launch video urls with mpv
 (defun browse-url-mpv-open (url &optional ignored)
  "Pass the specified URL to the \"mpv\" command.
xdg-open is a desktop utility that calls your preferred web browser.
The optional argument IGNORED is not used."
  (interactive (browse-url-interactive-arg "URL: "))
  (call-process "mpv" nil 0 nil url))

(bind-key "C-c m l" #'browse-url-mpv-open)


;; Load other config files
(load! (concat doom-user-dir "private"))

;;; config.el ends here ;;;
