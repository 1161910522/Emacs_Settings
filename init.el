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
 '(TeX-command-list
   (quote
    (("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t)
     ("TeX" "%(PDF)%(tex) %(file-line-error) %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "amstex %(PDFout) %(extraopts) %`%S%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "%(cntxcom) --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "%(cntxcom) %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-dvips t t :help "Generate PostScript file")
     ("Dvips" "%(o?)dvips %d -o %f " TeX-run-dvips nil t :help "Convert DVI file to PostScript")
     ("Dvipdfmx" "dvipdfmx %d" TeX-run-dvipdfmx nil t :help "Convert DVI file to PDF with dvipdfmx")
     ("Ps2pdf" "ps2pdf %f" TeX-run-ps2pdf nil t :help "Convert PostScript file to PDF")
     ("Glossaries" "makeglossaries %s" TeX-run-command nil t :help "Run makeglossaries to create glossary file")
     ("Index" "makeindex %s" TeX-run-index nil t :help "Run makeindex to create index file")
     ("upMendex" "upmendex %s" TeX-run-index t t :help "Run upmendex to create index file")
     ("Xindy" "texindy %s" TeX-run-command nil t :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (cdlatex auctex yasnippet auto-complete highlight-operators highlight-numbers molokai-theme powerline)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

;;设置主题
(load-theme 'molokai t)
;;关闭多余buffer
(kill-buffer "*scratch*")
;;设置编码方式
(prefer-coding-system 'utf-8)
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
(setq linum-format " %d ")
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
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20170124.1845")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20170124.1845/dict/")
(ac-config-default)
;;yasnippet
(yas-global-mode t)
;;AUCTeX
(add-hook 'LaTeX-mode-hook (lambda() (setq TeX-command-default "XeLaTeX")))
;;CDLaTeX
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
