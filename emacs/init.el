;; Copyright (C) 2025 by Avishek Gorai
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;; -*- lexical-binding: t; -*-

(setq custom-file "~/.config/emacs/emacs-custom.el"
      slime-lisp-implementations (list (list (quote steel-bank-common-lisp)
                                             (list "sbcl" "--userinit" (expand-file-name "~/.config/sbcl/init.lisp")))))

(load custom-file)

(cond ((eq system-type (quote windows-nt))
       (setq w32-lwindow-modifier (quote super))
       (w32-register-hot-key [M-tab])
       (w32-register-hot-key [s-])))

(load (expand-file-name "~/.quicklisp/slime-helper.el"))

(auto-insert-mode)

(windmove-default-keybindings)
(windmove-display-default-keybindings)
(windmove-delete-default-keybindings)
(windmove-swap-states-default-keybindings)

(ffap-bindings)

(recentf-mode)

(filesets-init)

(shadow-initialize)

(show-paren-mode)

(with-eval-after-load (quote dired)
  (require (quote dired-x))
  (setq dired-omit-files (concat dired-omit-files
				 "\\|^RCS$\\|,v$"
				 "\\|^INDEX$\\|-t\\.tex$"
				 "\\|^\\..+$")))

(add-hook (quote js-mode-hook) (function font-lock-mode))

(add-hook (quote c-mode-common-hook) (function font-lock-mode))

(add-hook (quote sh-mode-hook) (function font-lock-mode))

(add-hook (quote python-mode-hook) (function font-lock-mode))
(add-hook (quote python-mode-hook) (function flymake-mode))

(add-hook (quote text-mode-hook) (function flyspell-mode))

(add-hook (quote prog-mode-hook) (function flyspell-prog-mode))
(add-hook (quote prog-mode-hook) (function (lambda () (font-lock-mode -1))))
(add-hook (quote prog-mode-hook) (function hs-minor-mode))

(add-hook (quote dired-mode-hook) (function (lambda () (dired-omit-mode 1))))
(add-hook (quote dired-mode-hook) (function dired-hide-details-mode))
(add-hook (quote dired-mode-hook) (lambda () (font-lock-mode -1)))

(add-hook (quote lisp-mode-hook) (function paredit-mode))

(add-hook (quote emacs-lisp-mode-hook) (function paredit-mode))

;; Make windmove work in Org mode:
(add-hook (quote org-shiftup-final-hook) (function windmove-up))
(add-hook (quote org-shiftleft-final-hook) (function windmove-left))
(add-hook (quote org-shiftdown-final-hook) (function windmove-down))
(add-hook (quote org-shiftright-final-hook) (function windmove-right))

(add-hook (quote f90-mode-hook) (function abbrev-mode))

(add-hook (quote pascal-mode-hook) (function (lambda () (hs-minor-mode -1))))

(add-hook (quote before-save-hook) (function delete-trailing-whitespace))
(add-hook (quote before-save-hook) (function copyright-update))



(global-set-key (kbd "C-c l") (function org-store-link))
(global-set-key (kbd "C-c a") (function org-agenda))
(global-set-key (kbd "C-c c") (function org-capture))

(put (quote downcase-region) (quote disabled) nil)
