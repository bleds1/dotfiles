(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("fbd91b2e6dc5c7912e86406226638adb014612386516e078a0447195591447d3" "1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00" "7e068da4ba88162324d9773ec066d93c447c76e9f4ae711ddd0c5d3863489c52" "570263442ce6735821600ec74a9b032bc5512ed4539faf61168f2fdf747e0668" default))
 '(elfeed-feeds
   '(("https://itsfoss.com/feed/" linux tech)
     ("https://opensource.com/feed" linux tech)
     ("https://hackaday.com/blog/feed" linux tech)
     ("https://www.reddit.com/r/doomemacs.rss" reddit linux emacs)
     ("https://www.reddit.com/r/emacs.rss" reddit linux emacs)
     ("https://www.reddit.com/r/commandline.rss" reddit linux)
     ("https://www.reddit.com/r/linux.rss" reddit linux)
     ("https://www.bleepingcomputer.com/feed/" tech)
     ("http://feedproxy.google.com/brainpickings/rss" blog writing)
     ("http://gapingvoid.com/feed/" blog writing)
     ("https://www.omglinux.com/feed/" tech linux)
     ("https://sachachua.com/blog/feed/" tech emacs)
     ("https://www.linuxjournal.com/node/feed" tech linux)
     ("https://feeds.hyperallergic.com/hyperallergic" art)
     ("https://feeds.feedburner.com/typepad/sethsmainblog" writing blog)
     ("https://feeds.feedburner.com/wpbeginner" tech web)
     ("https://feeds.feedburner.com/CssTricks" tech web)
     ("https://feeds.feedburner.com/TheWritePractice" writing)
     ("https://thesweetsetup.com/feed/" tech gtd)
     ("https://www.lifehack.org/feed/" gtd)
     ("https://feeds.feedburner.com/zenhabits" gtd blog)
     ("https://www.workings.tools/feed" substack blog)
     ("https://theknowledgeworker.substack.com/feed" substack blog)
     ("https://www.abortretry.fail/feed" substack blog)
     ("https://pigmentandpixels.substack.com/feed" substack blog)
     ("https://dispatch.techlore.tech/feed" substack blog)
     ("https://onthespot.substack.com/feed" substack blog)
     ("https://jillianhess.substack.com/feed" substack blog)
     ("https://edwardsnowden.substack.com/feed" substack blog)
     ("https://louisestigell.substack.com/feed" substack blog)))
 '(highlight-indent-guides-method 'character)
 '(org-agenda-custom-commands
   '(("n" "3 day view with NEXT & TODO"
      ((agenda ""
        ((org-agenda-span '3)
         (org-agenda-overriding-header "3 day view:")))
       (tags-todo ":@refile:"
                  ((org-agenda-overriding-header "Inbox (Refile):")))
       (todo "NEXT"
             ((org-agenda-overriding-header "Next Actions (Projects):")))
       (todo "TODO"
             ((org-agenda-files
               '("~/Dropbox/roam/tasks.org"))
              (org-agenda-overriding-header "Tasks (Unscheduled):"))))
      nil)))
 '(package-selected-packages '(org-roam))
 '(warning-suppress-types
   '((org-element-cache)
     (org-element-cache)
     (org-element-cache)
     (org-element-cache)
     (defvaralias)) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#151515" :foreground "#a9b1d6"))))
 '(font-lock-comment-face ((t (:foreground "#757575"))))
 '(font-lock-keyword-face ((t (:foreground "#75afae"))))
 '(font-lock-string-face ((t (:foreground "#7ebebd"))))
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :foreground "#94E2D5" :weight bold :foundry "variable" :family "pitch"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.2))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.2))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.1))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.1))))
 '(markdown-metadata-key-face ((t (:foreground "#94E2D5"))))
 '(org-agenda-dimmed-todo-face ((t (:foreground "#949494"))))
 '(org-date ((t (:foreground "#82abab"))))
 '(org-document-title ((t (:height 1.2))))
 '(org-habit-alert-face ((t (:background "#C94E3B" :weight bold))))
 '(org-habit-clear-face ((t (:background "#151515" :weight bold))))
 '(org-habit-clear-future-face ((t (:background "#151515" :weight bold))))
 '(org-habit-overdue-face ((t (:background "#C280A0" :weight bold))))
 '(org-habit-ready-face ((t (:background "#4DB6AC" :weight bold))))
 '(org-scheduled-previously ((t (:foreground "#6CCDD5"))))
 '(org-sexp-date ((t (:foreground "#82abba"))))
 '(outline-1 ((t (:weight semi-bold :height 1.1))))
 '(outline-2 ((t (:weight semi-bold :height 1.1))))
 '(outline-3 ((t (:weight semi-bold :height 1.1))))
 '(outline-4 ((t (:weight semi-bold :height 1.1))))
 '(outline-5 ((t (:weight semi-bold :height 1.1))))
 '(outline-6 ((t (:weight semi-bold :height 1.1))))
 '(outline-8 ((t (:weight semi-bold))))
 '(outline-9 ((t (:weight semi-bold)))))
(put 'customize-variable 'disabled nil)
(put 'customize-face 'disabled nil)
