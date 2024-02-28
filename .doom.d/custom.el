(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("80214de566132bf2c844b9dee3ec0599f65c5a1f2d6ff21a2c8309e6e70f9242" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "0c08a5c3c2a72e3ca806a29302ef942335292a80c2934c1123e8c732bb2ddd77" "2078837f21ac3b0cc84167306fa1058e3199bbd12b6d5b56e3777a4125ff6851" "fbd91b2e6dc5c7912e86406226638adb014612386516e078a0447195591447d3" "1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00" "7e068da4ba88162324d9773ec066d93c447c76e9f4ae711ddd0c5d3863489c52" "570263442ce6735821600ec74a9b032bc5512ed4539faf61168f2fdf747e0668" default))
 '(doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode org-journal-mode))
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
 '(notmuch-saved-searches
   '((:name "flagged" :query "tag:flagged" :key "f")
     (:name "sent" :query "tag:sent" :key "s")
     (:name "new" :query "tag:new" :key "n")
     (:name "today" :query "date:today" :key "d")
     (:name "this week" :query "date:week" :key "w")
     (:name "todo" :query "tag:todo" :key "t")
     (:name "inbox" :query "folder:INBOX" :key "i")
     (:name "reference" :query "folder:Folders/reference")
     (:name "receipts" :query "folder:Folders/receipts")
     (:name "readlater" :query "tag:readlater")
     (:name "archive" :query "folder:Archive")
     (:name "unread" :query "tag:unread")))
 '(org-agenda-files
   '("~/Dropbox/org/goals.org" "/home/bledley/Dropbox/org/events.org" "/home/bledley/Dropbox/org/todo.org"))
 '(package-selected-packages '(vimrc-mode denote org-roam))
 '(send-mail-function 'smtpmail-send-it)
 '(smtpmail-smtp-server "posteo.de")
 '(smtpmail-smtp-service 25)
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
 '(default ((t (:inherit nil :extend nil :stipple nil :foreground "#BFBFBF" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 105 :width normal :foundry "JB" :family "JetBrains Mono"))))
 '(all-the-icons-dired-dir-face ((t (:foreground "#819cd6"))))
 '(doom-modeline-evil-insert-state ((t (:foreground "#47FFE0" :weight ultra-bold))))
 '(doom-modeline-evil-normal-state ((t (:foreground "#768EC3"))))
 '(doom-modeline-evil-visual-state ((t (:foreground "#FF85C0" :weight ultra-bold))))
 '(doom-modeline-fly-insert-state ((t (:foreground "#47FFE0" :weight ultra-bold))))
 '(markdown-header-delimiter-face ((t (:foreground "#9BAEC8" :height 0.9))))
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :foreground "#CFCFCF" :weight extra-bold :height 1.1 :foundry "variable" :family "Noto Sans CJK SC"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.1))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.0))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 0.9))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 0.9))))
 '(markdown-header-face-5 ((t (:height 1.05 :foreground "#9BAEC8" :weight bold :inherit markdown-header-face))))
 '(markdown-header-face-6 ((t (:height 1.05 :foreground "#9BAEC8" :weight semi-bold :inherit markdown-header-face))))
 '(markdown-italic-face ((t (:inherit italic :foreground "#A6A6A6"))))
 '(markdown-link-face ((t (:foreground "#819cd6"))))
 '(markdown-list-face ((t (:foreground "#a9b1b6"))))
 '(markdown-metadata-key-face ((t (:foreground "#819cd6"))))
 '(markdown-url-face ((t (:foreground "#819cd6" :weight normal)))))
(put 'customize-variable 'disabled nil)
(put 'customize-face 'disabled nil)
