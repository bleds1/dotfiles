;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;;
;; Header at the top of config supposedly improves speed to load? you do not need to run 'doom
;; sync' after modifying this file!
;;
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")
;;
;; BASICS
;;
;; Start Doom screen maximized
;;(add-hook 'window-setup-hook #'toggle-frame-fullscreen)
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
;; Undo limit 80mb/More granual changes whilst in insert
(setq undo-limit 80000000
      evil-want-fine-undo t
;;
;; Scroll  Margin
      scroll-margin 2)
;;
;; Display time in modeline
(display-time-mode 1)
(setq display-time-format "%H:%M")
;;
;; Word count in modeline
(setq doom-modeline-enable-word-count t)
;;
;; Height of modeline
(setq doom-modeline-height 15)
;;
;; Disable quit confirmation message
(setq confirm-kill-emacs nil)
;;
;; Relative line numbers
(setq display-line-numbers-type 'relative)
;;
;; Better default buffer names
(setq doom-fallback-buffer-name "DOOM"
      +doom-dashboard-name "DOOM")
;;
;; Quick access dashboard key
(map! :leader :desc "Dashboard" "d" #'+doom-dashboard/open)
;;
;; FONTS
;;
;; Doom exposes five (optional) variables for controlling fonts:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept.
;;
(setq doom-font (font-spec :family "JetBrains Mono" :size 13 :weight 'Medium)
      doom-big-font (font-spec :family "JetBrains Mono" :size 15 :weight 'Medium)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 16))
;;
;; THEME & LOOK
;;
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This was the default until changed:
;;
(setq doom-theme 'doom-wilmersdorf)
  (custom-set-faces
  '(default ((t (:background "#1a1a1a")))))
;;
;; Solaire mode needs to disabled for consistent background color
(after! solaire-mode
  (solaire-global-mode -1))
;;
;; Set splash page image
(setq fancy-splash-image "~/.doom.d/splash/doom-emacs-bw-light.svg")
;;
;(add-to-list '+doom-dashboard-menu-sections
;            '("Add journal entry"
;             :icon (all-the-icons-octicon "calendar" :face 'doom-dashboard-menu-title)
;            :when (featurep! :lang org +journal)
;           :face (:inherit (doom-dashboard-menu-title bold))
;          :action org-journal-new-entry))
(assoc-delete-all "Open project" +doom-dashboard-menu-sections)
(assoc-delete-all "Open private configuration" +doom-dashboard-menu-sections)
;;
;;tree macs font
(setq doom-themes-treemacs-enable-variable-pitch nil)
;;
;;
;; Zen mode zoom
(setq +zen-text-scale 0.8)
;;
;; Org
;;
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;;
(after! org
(setq org-directory "~/Dropbox/org/")
(setq org-agenda-files
      (directory-files-recursively "~/Dropbox/org/" "\\.org$"))
(setq org-log-done 'time)
(setq org-agenda-span 10
      org-agenda-start-day "-3")
(setq org-agenda-custom-commands ;then define tags, see vid
(setq
org-fancy-priorities-list '("!" "M" "L")
 org-priority-faces
 '((?H :foreground "#E35959" :weight bold)
   (?M :foreground "#57D1B9" :weight bold)
   (?L :foreground "#B2ABAA" :weight bold))))
;;
(setq org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d"
      org-journal-file-format "%Y-%m-%d.org"
      org-journal-dir "~/Dropbox/org/roam/0_Inbox/journal/")
(setq org-ellipsis " ▾")
(setq org-superstar-cycle-headline-bullets '("◉" "○" "●" "○" "●" "○" "●"))
(setq org-hide-emphasis-markers t)
(setq org-agenda-start-with-log-mode t)
(setq org-log-into-drawer t)
(setq org-agenda-max-todos 20)
;;
(setq org-capture-templates
        '(("t" "Task" entry (file+olp "~/Dropbox/org/roam/tasks.org" "INBOX")
          "* TODO %?\n %U\n" :empty-lines 1)
         ("e" "Event" entry (file+olp "~/Dropbox/org/roam/events.org" "INBOX")
          "* EVENT %?%^{SCHEDULED}p" :empty-lines 1)
         ("n" "Fleeting Notes" entry (file "~/Dropbox/org/roam/0_Inbox/fleeting_notes.org")
        "* %?\n%U" :empty-lines 1)
         ("b" "Bookmark" plain (file+olp "~/Dropbox/org/roam/bookmarks.org" "INBOX")
          "%?" :empty-lines 2)
         ("d" "Daily Plan" plain (file+datetree "~/Dropbox/org/roam/daily_plan.org")
         (file "~/Dropbox/org/roam/3_Resources/templates/tpl-daily-plan.txt") :empty-lines 1)
        ("g" "Goal" plain (file+olp "~/Dropbox/org/roam/goals.org" "INBOX")
         (file "~/Dropbox/org/roam/3_Resources/templates/tpl-goals.txt") :empty-lines 1)
        ("p" "Project" plain (file+olp "~/Dropbox/org/roam/projects.org" "INBOX")
         (file "~/Dropbox/org/roam/3_Resources/templates/tpl-project.txt") :empty-lines 1)
         ("w" "Weekly Review" plain (file+datetree "~/Dropbox/org/roam/weekly_review.org")
         (file "~/Dropbox/org/roam/3_Resources/templates/tpl-weekly_review.txt") :empty-lines 1)
         ("r" "Reading List" plain (file+olp "~/Dropbox/org/roam/reading_list.org" "INBOX")
          "%?" :empty-lines 1)
         ("s" "Shopping List" plain (file "~/Dropbox/org/roam/shopping_list.org")
         "%?- [ ]" :empty-lines 0)))
(setq org-todo-keywords
      '((sequence
         "TODO(t)"
         "NEXT(n)"
         "LATER(l)"
         "GOAL(g)"
         "PROJECT(p)"
         "EVENT(e)"
         "REPEAT(r)"
         "SOMEDAY(s)"
         "|"
         "DONE(d)"
         "WAITING(w)"
         "CANCELLED(c)" )))
      org-todo-keyword-faces
      '(("TODO" :foreground "#7c7c75" :weight normal :underline t)
       ("NEXT" :foreground "#009994" :weight normal :underline t)
       ("LATER" :foreground "#acb0d0" :weight normal :underline t)
       ("SOMEDAY" :foreground "#acb0d0" :weight normal :underline t)
       ("WAITING" :foreground "#9f7efe" :weight normal :underline t)
       ("GOAL" :foreground "#acb0d0" :weight normal :underline t)
       ("PROJECT" :foreground "#acb0d0" :weight normal :underline t)
       ("EVENT" :foreground "#acb0d0" :weight normal :underline t)
       ("REPEAT" :foreground "#acb0d0" :weight normal :underline t)
       ("DONE" :foreground "#50a14f" :weight normal :underline t)
       ("CANCELLED" :foreground "#ff6480" :weight normal :underline t)))
;;
;; org-roam
(after! org
(setq org-roam-directory "~/Dropbox/org/roam/")
(setq org-roam-index-file "~/Dropbox/org/roam/index.org")
(setq org-roam-completion-everywhere t)
(setq org-roam-capture-templates
   '(("n" "Default Note" plain
      "%?"
      :if-new (file+head "%<%Y-%m-%d-%H%M>-${slug}.org" "#+TITLE: ${TITLE}\n#+date: %U\n")
      :unnarrowed t)
     ("l" "Lit Notes" plain
 "\n* Source\n\nAuthor: %^{Author}\nTitle: ${title}\nYear: %^{Year}\n\n* Summary\n\n%?"
      :if-new (file+head "%<%Y-%m-%d-%H%M>-${slug}.org" "#+TITLE: ${TITLE}\n#+date: %U\n")
      :unnarrowed t)))

(setq org-roam-dailies-capture-templates
    '(("d" "default" entry "* %<%I:%M %p>: %?"
       :if-new (file+head "%<%Y-%m-%d>.org" "#+TITLE: %<%Y-%m-%d>\n")))))
;;
(setq org-roam-dailies-directory "~/Dropbox/org/roam/0_Inbox/")
;; Autosave disable/enable
(setq auto-save-default t)
;;
;; Projectile Dir
(setq projectile-project-search-path '("~/dotfiles/" "~/Dropbox/org/roam/"))
;;
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
