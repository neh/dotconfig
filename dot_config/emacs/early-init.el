;; -*- lexical-binding: t -*-

(let ((file-name-handler-alist nil))
  (setq gc-cons-threshold most-positive-fixnum)
  (setq package-enable-at-startup nil)
  (setq use-package-verbose nil
        use-package-always-ensure t)
  (setq gc-cons-threshold (* 3200 1000)
        gc-cons-percentage 0.6)
  
  (defvar my/gc-idle-timer nil)
  (unless (timerp my/gc-idle-timer)
    (setq my/gc-idle-timer (run-with-idle-timer 5 t #'garbage-collect))))
