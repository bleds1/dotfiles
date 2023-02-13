(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7e068da4ba88162324d9773ec066d93c447c76e9f4ae711ddd0c5d3863489c52" "570263442ce6735821600ec74a9b032bc5512ed4539faf61168f2fdf747e0668" default))
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
 '(org-agenda-custom-commands
   '(("n" "3 day view with NEXT & TODO"
      ((agenda ""
        ((org-agenda-span '3)
         (org-agenda-overriding-header "3 day view:")))
       (tags-todo ":@refile:"
                  ((org-agenda-overriding-header "Refile:")))
       (todo "NEXT"
             ((org-agenda-overriding-header "Next Actions:")))
       (todo "TODO"
             ((org-agenda-files
               '("~/Dropbox/org/roam/tasks.org"))
              (org-agenda-overriding-header "Tasks:"))))
      nil)))
 '(package-selected-packages '(org-roam)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#1a1a1a" :foreground "#a9b1d6"))))
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight semi-bold :family "variable-pitch"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.2))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.2))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.1))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.1))))
 '(org-document-title ((t (:height 1.2))))
 '(outline-1 ((t (:weight semi-bold :height 1.1))))
 '(outline-2 ((t (:weight semi-bold :height 1.1))))
 '(outline-3 ((t (:weight semi-bold :height 1.1))))
 '(outline-4 ((t (:weight semi-bold :height 1.1))))
 '(outline-5 ((t (:weight semi-bold :height 1.1))))
 '(outline-6 ((t (:weight semi-bold :height 1.1))))
 '(outline-8 ((t (:weight semi-bold))))
 '(outline-9 ((t (:weight semi-bold)))))
