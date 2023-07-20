;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;;
;; Bledley's Doom Emacs Config
;; TODO - I'm getting some errors about mu4e being a depreciated package at startup but mostly works still despite
;;
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;(setq user-full-name ""
;      user-mail-address "")
;;
;; Ask for buffer on window split
(setq evil-vsplit-window-right t
      evil-split-window-below t)
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))
;;
;; Delete files to trash
(setq-default
      delete-by-moving-to-trash t)
;;
(setq undo-limit 80000000 ; undo limit 80mb
      evil-want-fine-undo t ; more granual changes whilst in insert
      scroll-margin 2) ; scroll margin
;;
(after! doom-modeline
  (remove-hook 'doom-modeline-mode-hook #'size-indication-mode) ; filesize in modeline
;; (remove-hook 'doom-modeline-mode-hook #'column-number-mode)   ; cursor column in modeline
  (line-number-mode 1)
  (display-time-mode -1)
  (setq doom-modeline-enable-word-count t)
;;(setq display-time-format "%H:%M")
  (setq display-time-format "%Y_%m_%d %H:%M")
  (setq doom-modeline-height 15)
  (setq display-time-default-load-average nil)
  (setq doom-modeline-modal-icon nil)
  (setq doom-modeline-buffer-encoding nil))
;;
(setq confirm-kill-emacs nil) ;; Disable quit confirmation message
;;
(setq display-line-numbers-type nil)  ;; Relative line numbers
;;
;;Better default buffer names
;(setq doom-fallback-buffer-name "*dashboard*")
;
;; Initial buffer with emacsclient
(setq initial-buffer-choice (lambda () (get-buffer-create "*scratch*")))
;; Scratch buffer intital text
;;(setq initial-scratch-message "# This buffer is for text that is not saved or Lisp evaluation.\n# To create a file, visit with C-x C-f and enter text in it's buffer. ")
(setq initial-scratch-message nil)
(setq initial-major-mode 'org-mode)
;;(setq initial-major-mode 'lisp-mode)
;;(setq initial-major-mode 'fundamental-mode)
(global-set-key (kbd "C-c s") (lambda () (interactive) (switch-to-buffer "*scratch*")))
;;
;; Connect to main workspace on launch
(after! persp-mode
  (setq persp-emacsclient-init-frame-behaviour-override "main"))
;;
(setq doom-font (font-spec :family "Iosevka" :size 14 :weight 'Medium)
     doom-big-font (font-spec :family "Iosevka" :size 14 :weight 'Medium)
     doom-variable-pitch-font (font-spec :family "Iosevka" :size 14 :weight 'Medium))
;;
(setq doom-theme 'doom-wilmersdorf)
  (custom-set-faces
  '(default ((t (:background "#151515" :foreground "#a9b1d6")))))
;;
;; Solaire mode needs to disabled for consistent background color
(after! solaire-mode
  (solaire-global-mode -1))
;;
;; Zen mode zoom
(setq +zen-text-scale 0.3)
;;
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(after! org
(setq org-directory "~/Dropbox/roam/")
(setq org-agenda-files (directory-files-recursively "~/Dropbox/roam/" "\\.org$"))
;;
;; My agenda custom commands
(defun my-agenda-custom ()
  (interactive)
  (org-agenda nil "n"))
;;
;; map leader a (previously act on?) to my agenda view
(map! :leader
      :desc "My agenda custom"
      "a" #'my-agenda-custom)
;;
;; Org agenda custom view
(setq org-agenda-custom-commands
   '(("n" "Overview"
      ((agenda ""
        ((org-agenda-span '1)
         (org-agenda-overriding-header "Today:")))
       (tags-todo ":@refile:"
                  ((org-agenda-overriding-header "Inbox (@refile):")))
       (tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High Priority:")))
       (todo "STARTED"
             ((org-agenda-overriding-header "Active:")))
       (todo "NEXT"
             ((org-agenda-overriding-header "Project (Next Actions):")))
       (todo ""
             ((org-agenda-files
               '("~/Dropbox/roam/tasks.org" "~/Dropbox/roam/shopping.org"))
              (org-agenda-overriding-header "Other Tasks:"))))
      nil)))
;;
(setq org-agenda-block-separator ?┈
org-agenda-time-grid
'((daily today require-timed)
(800 1000 1200 1400 1600 1800 2000)
" ┈┈┈┈ " "┈┈┈┈┈┈┈┈┈┈┈┈┈")
org-agenda-current-time-string
"! now ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈")
;;
(setq org-attach-id-dir "~/Dropbox/roam/assets/")
(setq org-startup-folded t)
(setq org-log-done 'time)
(setq org-clock-into-drawer t)
(setq org-deadline-warning-days 0)
(setq org-agenda-span 5
      org-agenda-start-day "-1")
(setq org-refile-targets (quote (("~/Dropbox/roam/tasks.org" :maxlevel . 4)
                                 ("~/Dropbox/roam/repeat.org" :level . 4)
                                 ("~/Dropbox/roam/bookmarks.org" :level . 4)
                                 ("~/Dropbox/roam/events.org" :level . 4)
                                 ("~/Dropbox/roam/goals.org" :level . 4)
                                 ("~/Dropbox/roam/archive.org" :level . 4)
                                 ("~/Dropbox/roam/reading.org" :level . 4)
                                 ("~/Dropbox/roam/shopping.org" :level . 4)
                                 ("~/Dropbox/roam/someday.org" :level . 4))))
(after! org
(setq! org-agenda-use-tag-inheritance t
      org-ellipsis " ▾ "
      org-hide-leading-stars t
      org-priority-highest '?A
      org-priority-lowest '?D
      org-default-priority '?C
      org-priority-faces '((?A :foreground "#989DAF")
                           (?B :foreground "#8C92A6")
                           (?C :foreground "#80869c")
                           (?D :foreground "#757C94"))))
;;
(add-hook! 'org-mode-hook 'org-fancy-priorities-mode)
(add-hook! 'org-agenda-mode-hook 'org-fancy-priorities-mode)
;;
(after! org-fancy-priorities
  (setq!
   org-fancy-priorities-list
   '("[A]" "[B]" "[C]" "[D]")
   ))
;;
(set-popup-rule! "^\\*Org Agenda" :side 'right :size 0.50 :select t :ttl nil)
(set-popup-rule! "^\\*eww*" :side 'right :size 0.50 :select t :ttl nil)
(set-popup-rule! "^\\*vterm*" :side 'left :size 0.50 :vslot -4 :select t :quit nil :ttl nil)
;;
(after! org
(setq!
      org-journal-time-prefix "** "
      org-journal-date-prefix "* "
      org-journal-time-format "%H:%M"
      org-journal-date-format "%Y-%m-%d"
      org-journal-file-format "%Y_%m_%d.org"
      org-journal-dir "~/Dropbox/roam/journals/"
      org-superstar-headline-bullets-list '("◉" "○" "○" "○" "○" "○" "○")
      org-hide-emphasis-markers t
      org-agenda-start-with-log-mode t
      org-log-into-drawer t
      org-agenda-max-todos 10))
;;
(defun org-journal-find-location ()
  ;; Open today's journal, but specify a non-nil prefix argument in order to
  ;; inhibit inserting the heading; org-capture will insert the heading.
  (org-journal-new-entry t)
  (unless (eq org-journal-file-type 'daily)
    (org-narrow-to-subtree))
    (goto-char (point-max)))
;;
(after! org
(setq! org-capture-templates
        '(("i" "Task" entry (file+olp "~/Dropbox/roam/tasks.org" "INBOX")
          "** TODO %?\n")
          ("n" "Quick Note" entry (file+olp "~/Dropbox/roam/tasks.org" "INBOX")
          "** %?\n%U\n")
          ("j" "Journal entry" plain (function org-journal-find-location)
                               "** %(format-time-string org-journal-time-format)\n  - %?")
          ("m" "Mail" entry (file+olp "~/Dropbox/roam/tasks.org" "EMAIL")
          "** TODO %a\n")
          ("t" "Text at point" entry (file+olp "~/Dropbox/roam/tasks.org" "INBOX")
          "** TODO %a\n")
         ("e" "Event" entry (file+olp "~/Dropbox/roam/events.org" "INBOX")
          "** EVENT %?%^{SCHEDULED}p" :empty-lines 1)
        ("b" "Bookmark" plain (file+olp "~/Dropbox/roam/tasks.org" "INBOX")
         "** %?")
        ("g" "Goal" plain (file+olp "~/Dropbox/roam/goals.org" "INBOX")
         (file "~/Dropbox/3_Resources/templates/tpl-goals.txt") :empty-lines 1)
         ("f" "Expenses" plain (file+olp "~/Dropbox/roam/expenses.org" "INBOX")
         "** %U - %^{Amount} %^{Summary} %^g" :prepend t)
        ("s" "Someday/Maybe" entry (file+olp "~/Dropbox/roam/someday.org" "INBOX")
          "* SOMEDAY %?\n %U\n" :empty-lines 1)
         ("w" "Weekly Review" plain (file+datetree "~/Dropbox/roam/weekly.org")
         (file "~/Dropbox/3_Resources/templates/tpl-weekly_review.txt") :empty-lines 1)
         ("r" "Reading List" plain (file+olp "~/Dropbox/roam/tasks.org" "INBOX")
          "** %?" :empty-lines 1)
         ("l" "Shopping List" plain (file "~/Dropbox/roam/shopping.org")
         "* TODO %?" :empty-lines 0))))
(after! org
(setq! org-todo-keywords
      '((sequence
         "TODO(t)"
         "STARTED(s)"
         "NEXT(n)"
         "IDEA(i)"
         "GOAL(g)"
         "AREA(a)"
         "PROJECT(p)"
         "EVENT(e)"
         "HABIT(h)"
         "REVIEW(r)"
         "SOMEDAY(y)"
         "|"
         "DONE(d)"
         "WAITING(w)"
         "CANCELLED(c)" ))))
(setq! org-todo-keyword-faces ;these colours are not working/defined by theme?
      '(("TODO" :foreground "#C280a0" :weight bold)
       ("STARTED" :foreground "#66FFD6" :weight bold)
       ("NEXT" :foreground "#FFFBB8" :weight bold)
       ("IDEA" :foreground "#C280A0" :weight bold)
       ("SOMEDAY" :foreground "#AAAAE1" :weight bold)
       ("WAITING" :foreground "#AAAAE1" :weight bold)
       ("GOAL" :foreground "#65DDA3" :weight bold)
       ("AREA" :foreground "#8C8DFF" :weight bold)
       ("PROJECT" :foreground "#8C8DFF" :weight bold)
       ("EVENT" :foreground "#5099DA" :weight bold)
       ("HABIT" :foreground "#C280A0" :weight bold)
       ("REVIEW" :foreground "#8C8DFF" :weight bold)
       ("DONE" :foreground "#2FF9D1" :weight bold)
       ("CANCELLED" :foreground "#80869c" :weight bold))))
(after! org
(setq! org-tag-faces
   '(("@habit" :foreground "#C280a0")
     ("@important" :foreground "#c280a0"))))
;; Org-roam
(after! org
(setq org-roam-directory "~/Dropbox/roam/")
(setq org-roam-file-extensions '("org" "md")) ; enable Org-roam for a markdown extension
(setq org-roam-completion-everywhere t)
;(setq org-roam-capture-templates ; theres something wrong with either this or the capture template below causing an error
;;   '(("n" "Daily Note" plain
;;      "%?"
;;      :if-new (file+head "${slug}-%<%Y_%m_%d>.md" "---
;;title: ${TITLE}\n#+DATE: %U\n
;---"))))
;
(setq org-roam-dailies-capture-templates
    '(("d" "default" entry "* %<%I:%M %p>: %?"
       :if-new (file+head "%<%Y_%m_%d>.org" "#+TITLE: %<%Y_%m_%d>\n#+ID: %<%Y-%m-%d-%H%M>\n#+FILETAGS: fleeting\n---\n* What's on your mind?\n* %<%Y-%m-%d>\n"))))
;;
(setq org-roam-dailies-directory "~/Dropbox/roam/journals/"))
;;
;; Autosave disable/enable
(setq auto-save-default t)
;;
;; Place tags close to the right-hand side of the window - is this working?
(add-hook 'org-finalize-agenda-hook 'place-agenda-tags)
(defun place-agenda-tags ()
"Put the agenda tags by the right border of the agenda window."
(setq org-agenda-tags-column (- 4 (window-width)))
(org-agenda-align-tags))
;;
(require 'org-habit)
  (setq org-habit-following-days 7)
  (setq org-habit-preceding-days 30)
  (setq org-habit-show-habits t)
;;
;; Beacon global minor mode
(use-package! beacon) ;; Beacon
(after! beacon (beacon-mode 1))
;;
;; Focus ;; TODO Test I don't think this should be here without any settings?
(use-package! focus)
;;
;; Set browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "qutebrowser")
;;(setq browse-url-browser-function 'eww-browse-url)
;;
;; Keyboard shortcuts for regularly used files
(defun zz/add-file-keybinding (key file &optional desc)
  (let ((key key)
        (file file)
        (desc desc))
    (map! :desc (or desc file)
          key
          (lambda () (interactive) (find-file file)))))
(zz/add-file-keybinding "C-c i" "~/Dropbox/roam/tasks.org" "tasks.org")
(zz/add-file-keybinding "C-c t" "~/Dropbox/roam/tasks.org" "tasks.org")
(zz/add-file-keybinding "C-c e" "~/Dropbox/roam/events.org" "events.org")
(zz/add-file-keybinding "C-c r" "~/Dropbox/roam/reading.org" "reading.org")
(zz/add-file-keybinding "C-c a" "~/Dropbox/roam/archive.org" "archive.org")
(zz/add-file-keybinding "C-c c" "~/dotfiles/.doom.d/config.el" "config.el")
;;
(global-set-key (kbd "C-c w") 'count-words)
(global-set-key (kbd "C-c n") 'now)
(global-set-key (kbd "C-c d") 'org-roam-dailies-goto-today)
(global-set-key (kbd "C-c y") 'org-roam-dailies-goto-yesterday)
(global-set-key (kbd "C-c m") 'global-hide-mode-line-mode)
(global-set-key (kbd "<f12>") 'writeroom-mode)
(global-set-key (kbd "<f11>") 'focus-mode)
(global-set-key (kbd "C-c b") 'elfeed-show-visit-gui)
(define-key global-map (kbd "C-c l") #'elfeed)
;;
;; Make a new org buffer easier (from tecosaur.github.io)
(evil-define-command +evil-buffer-org-new (count file)
  "Creates a new ORG buffer replacing the current window, optionally
   editing a certain FILE"
  :repeat nil
  (interactive "P<f>")
  (if file
      (evil-edit file)
    (let ((buffer (generate-new-buffer "*new org*")))
      (set-window-buffer nil buffer)
      (with-current-buffer buffer
        (org-mode)
        (setq-local doom-real-buffer-p t)))))
(map! :leader
      (:prefix "n"
       :desc "New empty Org buffer" "O" #'+evil-buffer-org-new))
;;
;; Make a new md buffer easy
(evil-define-command +evil-buffer-md-new (count file)
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
;;
(map! :leader
      (:prefix "n"
       :desc "New empty md buffer" "M" #'+evil-buffer-md-new))
;;
(map! :leader
      (:prefix "n"
               :desc "Go to today's Daily Note" "d" #'org-roam-dailies-goto-today))

(map! :leader
      (:prefix "n"
               :desc "Go to yesterday's Daily Note" "D" #'org-roam-dailies-goto-yesterday))
;;
;; Dired keybinds
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
  (kbd "Y") 'dired-copy-filename-copy-filename-as-kill ; copies filename to kill ring.
  (kbd "Z") 'dired-do-compress
  (kbd "C") 'dired-create-directory
  (kbd "-") 'dired-do-kill-lines
  (kbd "n") 'evil-search-next
  (kbd "N") 'evil-search-previous
  (kbd "q") 'kill-this-buffer
  )
;;
;; Less details in Dired
(defun my-dired-mode-setup ()
  "to be run as hook for `dired-mode'."
  (dired-hide-details-mode 1))
(add-hook 'dired-mode-hook 'my-dired-mode-setup)
;;
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
 (defadvice! +rss-elfeed-wrap-h-nicer ()
    "Enhances an elfeed entry's readability by wrapping it to a width of
`fill-column' and centering it with `visual-fill-column-mode'."
    :override #'+rss-elfeed-wrap-h
    (setq-local truncate-lines nil
                shr-width 120
                visual-fill-column-center-text t
                default-text-properties '(line-height 1.1))
    (let ((inhibit-read-only t)
          (inhibit-modification-hooks t))
      (visual-fill-column-mode)
      (set-buffer-modified-p nil)))     )
;; browse article in gui browser instead of eww
(defun elfeed-show-visit-gui ()
  "Wrapper for elfeed-show-visit to use gui browser instead of eww"
  (interactive)
  (let ((browse-url-generic-program "xdg-open"))
    (elfeed-show-visit t)))
;; Note: The customize interface is also supported.
(setq rmh-elfeed-org-files (list "~/Dropbox/roam/elfeed.org"))
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
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)  ;;Highlight indent guides mode? Not working as expected..
;;
;; Projectile Dirs
(setq projectile-project-search-path '("~/dotfiles/" "~/bleds_blog/" "~/Dropbox/roam/"))
;;
;; My snippet functions
(defun my-md-front-matter ()
 (interactive)
 (insert "---\ntitle: ${title}\nid: %<%Y_%m_%d_%H%M>\ndate: %U\ntags: \n---\n")
 )
;; Org header snippet
(defun my-org-front-matter ()
 (interactive)
 (insert "#+TITLE: \n#+ID: \n#+FILETAGS: \n")
 )
;; Timestamp
(defun now ()
 (interactive)
 (insert (format-time-string "** %H:%M")
 ))
;;
;; My Jekyll front matter
(defun my-website-front-matter ()
 (interactive)
 (insert "---
layout: post
title: ""
date: 2023-00-00 00:00:00
categories:
---")
 )
;;
;; Md-roam
(use-package! md-roam
  :after org-roam
  :config
  (set-company-backend! 'markdown-mode 'company-capf)
  (setq org-roam-file-extensions '("org" "md"))
  (md-roam-mode 1)
  (org-roam-db-autosync-mode 1)
  (add-to-list 'org-roam-capture-templates
               '("n" "Node" plain "" :target
                 (file+head "${slug}.md"
                            "---\ntitle: ${title}\nid: %<%Y_%m_%d_%H%M>\ndate: %U\ntags: \n---\n")
                 :unnarrowed t))
  )
;; Rainbow Mode
(add-hook! org-mode 'rainbow-mode)
(add-hook! prog-mode 'rainbow-mode)
;;
;; Org timer function
(setq org-clock-sound "~/sfx/advance_ding.wav")
(add-hook 'org-timer-done-hook 'org-clock-out)
;
;; Remap space, space to switch to buffer instead of local files
(map! :leader
      :desc "Switch to buffer"
      "SPC" 'switch-to-buffer)
;;
;; Easier key for terminal popup
(map! :leader
      :desc "Vterm toggle"
      "v" '+vterm/toggle)
;; Mu4e
(global-set-key (kbd "<f6>") 'mu4e)
(defun my-mu4e-all-mail ()
  "jump to mu4e all mail"
  (interactive)
  (mu4e~headers-jump-to-maildir "/All Mail"))
;;
(map! :leader
      :desc "Jump to mu4e inbox"
      "oi" 'my-mu4e-all-mail)
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e/")
;;(require 'mu4e)
(require 'smtpmail)
(setq starttls-use-gnutls t)
;; Line below taken as quickfix from github https://github.com/doomemacs/doomemacs/issues/6906 C-z on mu4e-main and bookmarks work
(defconst mu4e-headers-buffer-name "*mu4e-headers*"
  "Name of the buffer for message headers.")
;(add-to-list 'gnutls-trustfiles (expand-file-name "~/.config/protonmail/bridge/cert.pem")) ;mail sent succesfully once this was commented out??
(setq mu4e-headers-buffer-name "*mu4e-headers*")
(setq mu4e-index-update-error-warning nil) ;supress [mu4e] Update process returned with non-zero exit code
(setq mu4e-change-filenames-when-moving t) ; avoid sync conflicts
(setq mu4e-update-interval 120) ; refresh interval
(setq mu4e-compose-format-flowed t) ; re-flow mail so it's not hard wrapped
(setq mu4e-get-mail-command "mbsync -a")
(setq mu4e-root-maildir "~/.mail")
(setq mu4e-drafts-folder "/Drafts")
(setq mu4e-sent-folder   "/Sent")
(setq mu4e-refile-folder "/Archive")
(setq mu4e-trash-folder  "/Trash")
(setq message-send-mail-function 'smtpmail-send-it)
(setq auth-sources '("~/.authinfo.gpg"))
(setq smtpmail-auth-credentials "~/.authinfo.gpg")
(setq smtpmail-smtp-server "127.0.0.1")
(setq smtpmail-smtp-service 1025)
;;(setq smtpmail-stream-type  'ssl)
(setq message-kill-buffer-on-exit t)
(setq mu4e-headers-date-format "%Y-%m-%d %H:%M")
(setq mu4e-headers-time-format "%H:%M")
(setq mu4e-headers-fields
      '( (:date          .  25)    ;; alternatively, use :human-date
         (:flags         .   6)
         (:from-or-to          .  25)
         (:subject       .  nil))) ;; alternatively, use :thread-subject
(setq mu4e-headers-results-limit 1000)
(setq mu4e-index-cleanup t)
(setq mu4e-maildir-shortcuts
     '((:maildir "/INBOX"     :key ?i)
	(:maildir "/Sent"     :key ?s)
	(:maildir "/Drafts"    :key ?d)
        (:maildir "/Folders/sba.com" :key ?a)
        (:maildir "/Folders/bledspixel" :key ?b)
        (:maildir "/Folders/Gmail" :key ?g)
        (:maildir "/Folders/iCloud" :key ?c)
        (:maildir "Folders/SimpleLogin" :key ?l)
	(:maildir "/Trash"     :key ?t)
	(:maildir "/Spam"     :key ?p)
        (:maildir "/Archive"  :key ?r)
	(:maildir "/All Mail"  :key ?m)))
;;(add-to-list 'mu4e-bookmarks
 ;;            '(:name "Yesterday's messages" :query "date:2d..1d" :key ?y) t) ;;error void variable? but works
(setq mu4e-alert-icon "/usr/share/icons/Papirus/64x64/apps/mailspring.svg")
(setq mu4e-compose--org-msg-toggle-next nil)
(mu4e t)
