;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
; Fonts
(setq doom-font (font-spec :family "FreeMono" :size 13)
      doom-big-font (font-spec :family "FreeMono" :size 13)
      doom-serif-font (font-spec :family "FreeMono" :size 13)
      doom-variable-pitch-font (font-spec :family "FreeMono" :size 13))
; Dashboard
(setq fancy-splash-image (concat doom-user-dir "emacs-e-template.svg"))
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

(setq confirm-kill-emacs nil)

; Initial buffer
;; (setq initial-buffer-choice (lambda () (get-buffer-create "*scratch*")))
(setq initial-scratch-message ";; scratch buffer ;;")
(setq initial-major-mode 'lisp-mode)
(global-set-key (kbd "C-c s") (lambda () (interactive) (switch-to-buffer "*scratch*")))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-roam-directory "~/org/roam/")
(setq org-roam-dailies-directory "~/org/roam/daily/")
; Org Mode
(after! org
(setq org-log-done 'time
      org-log-into-drawer t
      org-agenda-start-with-log-mode t
      org-log-reschedule 'time
      org-deadline-warning-days 1
      org-ellipsis " ▾ "
      org-hide-emphasis-markers t
      org-clock-into-drawer t)
(setq! org-todo-keywords
      '((sequence
         "TODO(t)"
         "DOING(a)"
         "NEXT(n)"
         "UPCOMING(u)"
         "WAITING(w)"
         "GOAL(g)"
         "PROJECT(p)"
         "DELEGATED(/)"
         "SOMEDAY(s)"
         "|"
         "DONE(d)"
         "CANCELLED(c)" )))
(setq! org-todo-keyword-faces
      '(("TODO" :foreground "#cc4d3e" :weight bold)
       ("DOING" :foreground "#1c7870" :weight bold)
       ("NEXT" :foreground "#845bc8" :weight bold)
       ("UPCOMING" :foreground "#ffc561" :weight bold)
       ("WAITING" :foreground "#83898d" :weight bold)
       ("GOAL" :foreground "#cc4d3e" :weight bold)
       ("PROJECT" :foreground "#845bc8" :weight bold)
       ("DELEGATED" :foreground "#5d6265" :weight bold)
       ("SOMEDAY" :foreground "#5d6265" :weight bold)
       ("DONE" :foreground "#2b8c63" :weight bold)
       ("CANCELLED" :foreground "#5d6265" :weight bold))))
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

; Org Capture Templates
(after! org
  (setq! org-capture-templates
         '(("i" " Todo" entry (file "~/org/inbox.org")
            (file "~/org/tpl/tpl-todo.txt") :empty-lines-before 1)
           ("c" " Contact" plain (file "~/org/contacts.org")
            (file "~/org/tpl/tpl-contact.txt"))
           ("d" " Daily Plan" plain (file+datetree "~/org/daily.org")
            (file "~/org/tpl/tpl-daily.txt") :immediate-finish t)
           ("e" " Event" entry (file "~/org/events.org")
            "** %?")
           ("g" " Goal" entry (file+headline "~/org/goals.org"
            "Capture") (file "~/org/tpl/tpl-goal.txt"))
           ("m" " Mail" entry (file+olp "~/org/inbox.org" "INBOX")
          "** TODO %a :@email:@computer: \nSCHEDULED:%t\n\n%i")
           ("s" " Someday" entry (file "~/org/someday.org")
             (file "~/org/tpl/tpl-someday.txt") :empty-lines-before 1)
           ("w" " Weekly Review" plain (file buffer-name)
            (file "~/org/tpl/tpl-weekly.txt") :empty-lines 1)
            )
           ))
;; Org Agenda Custom Commands
(setq org-agenda-custom-commands
 '(

   ("Ph" "High Priority"
    ((tags-todo "+H-DONE-@someday")))

   ("Pm" "Medium Priority"
    ((tags-todo "+M-DONE-@someday")))

   ("Pl" "Low Priority"
    ((tags-todo "+L-DONE-@someday")))

   ("1" "10min"
    ((tags-todo "+10min-@goal-@someday-@refile")))

   ("3" "30min"
    ((tags-todo "+30min-@goal-@someday-@refile")))

   ("0" "1hr"
    ((tags-todo "+1hr-@goal-@someday-@refile")))

   ("b" "@art"
    ((tags-todo "+@art-@goal-@someday-@refile")))

   ("c" "@computer"
    ((tags-todo "+@computer-@goal-@someday-@refile")))

   ("d" "@domestic"
    ((tags-todo "+@domestic-@goal-@someday-@refile")))

   ("E" "@errands"
    ((tags-todo "+@errands-@goal-@someday-@refile")))

   ("h" "@health"
    ((tags-todo "+@health-@goal-@someday-@refile")))

   ("i" "Inbox"
    ((tags "@refile-@someday"
           ((org-agenda-overriding-header "Inbox needs refiling/scheduling"))
           )))

   ("n" "Next"
    ((todo "NEXT"
           ((org-agenda-overriding-header "Next Actions in Projects"))
           )))

   ("p" "Upcoming"
    ((todo "UPCOMING"
           ((org-agenda-overriding-header "Upcoming"))
           )))

   ("o" "Todo"
    ((todo "TODO"
           ((org-agenda-overriding-header "Todo's"))
           )))

   ("r" "@read"
    ((tags-todo "+@read-@goal-@someday-@refile")))

   ("l" "@socials"
    ((tags-todo "+@socials-@goal-@someday-@refile")))

   ("u" "Untagged"
    ((tags-todo "-@goal-@someday-{.*}")))

   ("v" "@video"
    ((tags-todo "+@video-@goal-@someday-@refile")))

   ("w" "@work"
    ((tags-todo "+@work-@goal-@someday-@refile")))

   ("W" "@website"
    ((tags-todo "+@website-@goal-@someday-@refile")))


      ))
(after! org
  (setq org-tag-alist
        '(
             ("H")
             ("M")
             ("L")
             ("@art")
             ("@computer")
             ("@domestic")
             ("@email")
             ("@errands")
             ("@health")
             ("@read")
             ("@socials")
             ("@video")
             ("@watch")
             ("@website")
             ("@work")
             ("10min")
             ("30min")
             ("1hr")
               ))
  (setq org-tag-alist-for-agenda
        '(
             ("H")
             ("M")
             ("L")
             ("@art")
             ("@computer")
             ("@domestic")
             ("@email")
             ("@errands")
             ("@health")
             ("@read")
             ("@socials")
             ("@video")
             ("@watch")
             ("@website")
             ("@work")
             ("10min")
             ("30min")
             ("1hr")
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
(zz/add-file-keybinding "C-c i" "~/org/inbox.org" "inbox.org")
(zz/add-file-keybinding "C-c n a" "~/org/na.org" "na.org")
(zz/add-file-keybinding "C-c b" "~/org/sba.org" "sba.org")
(zz/add-file-keybinding "C-c t" "~/org/personal.org" "personal.org")
(zz/add-file-keybinding "C-c e" "~/org/events.org" "events.org")
(zz/add-file-keybinding "C-c y" "~/org/daily.org" "daily.org")
(zz/add-file-keybinding "C-c w" "~/org/weekly.org" "weekly.org")
(global-set-key (kbd "C-c l") 'org-add-note)
(global-set-key (kbd "C-c n d") 'org-roam-dailies-goto-today)
(global-set-key (kbd "C-c d") 'org-roam-dailies-goto-today)
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
(global-set-key (kbd "C-c n m") 'notmuch-search)
(global-set-key (kbd "C-c g") 'count-words)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map (kbd "C-c c") #'org-capture)
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
      (:prefix ("n" . "org-roam-dailies-goto-yesterday")
                :desc "org-roam-dailies-goto-yesterday" "y" #'org-roam-dailies-goto-yesterday))
(map! :leader
      (:prefix ("n" . "Insert node immediate")
                :desc "Insert node immediate" "r I" #'org-roam-node-insert-immediate))
;; dashboard
(map! :leader
      :desc "+doom-dashboard/open"
      "d" '+doom-dashboard/open)
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
;; org agenda week/day view
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
;; Theme
(setq doom-theme 'modus-mono)
;; (setq doom-theme 'doom-one)
;; Cursor
(setq evil-normal-state-cursor '(box "#000000")
      evil-insert-state-cursor '(bar "#679FC7")
      evil-visual-state-cursor '(hollow "#c280A0"))
(after! solaire-mode
  (solaire-global-mode -1))
;;
;; Writeroom Zen mode appearance
;; (add-hook 'writeroom-mode-hook (lambda () (display-line-numbers-mode -1)))
(setq writeroom-mode-line t
      writeroom-width 120
      +zen-text-scale 0.3)

;; Org roam
(setq org-roam-db-autosync-mode t
      org-roam-db-update-method 'immediate
      org-id-method 'ts
      org-roam-completion-everywhere t)
(setq org-roam-capture-templates
      '(("s" "󰟷 Fleeting" plain
         "%?"
         :if-new (file+head "${slug}.org"
                            "#+title: ${title}\n#+filetags: fleeting seedling\n#+options: toc:nil num:nil author:nil\n")
         :immediate-finish t
         :unnarrowed t)
        ("r" " Reference" plain "%?"
         :if-new
         (file+head "${title}.org" "#+title: ${title}\n#+filetags: reference seedling\n#+options: toc:nil num:nil author:nil\n")
         :immediate-finish t
         :unnarrowed t)
        ("p" " Permanent" plain "%?"
         :if-new
         (file+head "${title}.org" "#+title: ${title}\n#+filetags: permanent seedling\n#+options: toc:nil num:nil author:nil\n")
         :immediate-finish t
         :unnarrowed t)
        ("a" " Article" plain "%?"
         :if-new
         (file+head "${title}.org" "#+title: ${title}\n#+filetags: article seedling\n#+options: toc:nil num:nil author:nil\n")
         :immediate-finish t
         :unnarrowed t)))
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry "* %<%H:%M> %?"
         :if-new (file+head "%<%Y%m%d>.org" "#+title: %<%Y-%m-%d %A>\n#+filetags: fleeting\n#+options: toc:nil num:nil author:nil\n")
         :empty-lines-before 1)))

;; (defun jethro/tag-new-node-as-seedling ()
;;   (org-roam-tag-add '("seedling")))
;; (add-hook 'org-roam-capture-new-node-hook #'jethro/tag-new-node-as-seedling)
;;
;; This function from System Crafters allows you to make empty node/links to detail out later
(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

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
;;
;; Vterm confirm quit
(after! vterm
  (setq vterm-kill-buffer-on-exit t))
;; Function to run my mail sync script
(defun mail-sync-script ()
  "Run my custom shell script"
  (interactive)
  (call-process "~/.scripts/mail-sync.sh" nil 0))

(map! :leader
      :desc "mail sync script" "m s" #'mail-sync-script)
;;
(defun notmuch-inbox-search ()
  "Search for emails with the tag:inbox using notmuch"
  (interactive)
  (notmuch-search "tag:inbox"))

(map! :leader
      :desc "Search inbox" "o i" #'notmuch-inbox-search)

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

;; hl-line mode
(setq hl-line-mode nil)
(setq global-hl-line-mode nil)

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
;; Global hl line mode
(setq hl-line-mode nil)
(setq global-hl-line-mode nil)
