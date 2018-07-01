;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (auctex yasnippet auto-complete highlight-operators highlight-numbers molokai-theme powerline obsidian-theme)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

;;设置主题
(load-theme 'molokai t)
;;关闭多余buffer
(kill-buffer "*scratch*")
;;设置英文字体
(set-face-attribute
 'default nil :font "Consolas 12")
;;设置中文字体
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "微软雅黑" :size 18)))
;;窗口大小
(set-frame-width (selected-frame) 170)
(set-frame-height (selected-frame) 40)
;;缩进
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq c-default-style "Linux")
(setq c-basic-offset 4)
;;括号补全
(electric-pair-mode t)
;;显示行号
(global-linum-mode t)
(setq linum-format "% 4d ")
;;光标
(setq-default cursor-type 'bar)
(set-cursor-color "white")
;;高亮当前行
(global-hl-line-mode t)
;;一键打开终端
(global-set-key (kbd "<f10>") 'shell)
;;一键编译
(defun compile-file ()
  (interactive)
  (if (equal (message "%s" major-mode) "c-mode") (compile (format "gcc -o %s %s -g -Wall -std=c11" (file-name-sans-extension (buffer-name)) (buffer-name))))
  (if (equal (message "%s" major-mode) "c++-mode") (compile (format "g++ -o %s %s -g -Wall -std=c++14" (file-name-sans-extension (buffer-name)) (buffer-name))))
  (if (equal (message "%s" major-mode) "java-mode") (compile (format "javac %s" (buffer-name)))))
(global-set-key (kbd "<f9>") 'compile-file)
;;一键调试
(global-set-key (kbd "<f7>") 'gud-gdb)
;;添加插件源
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
;;highlight-numbers
(add-hook 'prog-mode-hook 'highlight-numbers-mode)
;;highlight-operators
(add-hook 'prog-mode-hook 'highlight-operators-mode)
;;powerline
(powerline-default-theme)
;;auto-complete
(global-auto-complete-mode t)
;;yasnippet
(yas-global-mode t)
;;auctex
(setq-default TeX-engine 'xetex)
