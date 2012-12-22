#!/bin/bash

OPT=$(runhaskell langopt.hs)

(cat <<EOF
;;
;; generated @$(date +"%F %T")
;;
(defvar haskell-langopts '(
$OPT
))

(defvar helm-c-source-haskell-langopt
  \`((name . "Haskell Language Options")
    (candidates . haskell-langopts)
    (action . (("Insert Language Option" . insert-haskell-langopt)))))

;;
;; TODO.
;;   check duplicated declaration, and drop
;;
;;;###autoload
(defun insert-haskell-langopt (candid)
  (let ((opt (replace-regexp-in-string "[ ]*:[^:]+" "" candid)))
    (save-excursion
      (goto-char (point-min))
      (insert (concat "{-# LANGUAGE " opt " #-}\n")))))

(defun helm-haskell-langopt ()
  (interactive)
  (helm :sources '(helm-c-source-haskell-langopt)
        :buffer "*haskell-lang-opts*"
        :default (buffer-name helm-current-buffer)))
EOF
) > helm-lang-opt.el