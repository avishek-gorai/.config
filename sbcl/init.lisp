;;; The following lines added by ql:add-to-init-file:
#-quicklisp
(let ((quicklisp-init (merge-pathnames ".quicklisp/setup.lisp" (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))


;;; These lines were added by me.

(push (merge-pathnames "src/" (user-homedir-pathname)) ql:*local-project-directories*)


(ql:quickload (quote quickproject))


(setf quickproject:*author* "Avishek Gorai <avishekgorai@myyahoo.com>")


(setf quickproject:*include-copyright* t)


(setf quickproject:*license* "GNU General Public License version 3 or later.")


(defmacro ppmx (form)
  "Pretty prints macro expansions of FORM."
  `(let* ((exp1 (macroexpand-1 ',form))
          (exp (macroexpand exp1))
          (*print-circle* nil))
     (cond ((equal exp exp1)
            (format t "~&Macro expansion:")
            (pprint exp))
           (t (format t "~&First step of expansion:")
              (pprint exp1)
              (format t "~%~%Final expansion:")
              (pprint exp)))
     (format t "~%~%")
     (values)))


;; Local Variables:
;; mode: lisp
;; End:
