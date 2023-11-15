;; -*- lexical-binding: t -*-

(let ((file-name-handler-alist nil))
  (setq gc-cons-threshold most-positive-fixnum)
  (setq straight-check-for-modifications '(check-on-save))
  ;; (setq native-comp-deferred-compilation-deny-list ()
        ;; comp-deferred-compilation-deny-list ())
  ;; (setq straight-repository-branch "develop")
  (defvar bootstrap-version)
  (let ((bootstrap-file
         (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
        (bootstrap-version 6))
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
          (url-retrieve-synchronously
           "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
           'silent 'inhibit-cookies)
        (goto-char (point-max))
        (eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage))
  (setq straight-vc-git-auto-fast-forward nil)
  (straight-use-package 'org)
  (setq straight-use-package-by-default t)
  (straight-use-package 'use-package)
  (setq use-package-verbose nil)
  (use-package org
    :demand t
    :config
    (message "%s" (org-version))
    (setq custom-enabled-themes '())
  
    (let ((orgfile (concat user-emacs-directory "emacs.org"))
          (elfile (concat user-emacs-directory "init.el"))
          (earlyfile (concat user-emacs-directory "early-init.el")))
      (when (or (not (file-exists-p elfile))
                (file-newer-than-file-p orgfile elfile)
                (file-newer-than-file-p orgfile earlyfile))
        (org-babel-tangle-file orgfile)))
    )
  (setq gc-cons-threshold (* 3200 1000)
        gc-cons-percentage 0.6)
  
  (defvar my/gc-idle-timer nil)
  (unless (timerp my/gc-idle-timer)
    (setq my/gc-idle-timer (run-with-idle-timer 5 t #'garbage-collect))))
