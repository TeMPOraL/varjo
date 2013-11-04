;; This software is Copyright (c) 2012 Chris Bagley
;; (techsnuffle<at>gmail<dot>com)
;; Chris Bagley grants you the rights to
;; distribute and use this software as governed
;; by the terms of the Lisp Lesser GNU Public License
;; (http://opensource.franz.com/preamble.html),
;; known as the LLGPL.

(in-package :varjo)

;; remember that args has context in it
(defun new-translate (args body)
  (let ((env (make-instance 'environment)))
    (pipe-> (args body env)
      #'split-input-into-env
      #'process-in-args
      #'process-uniforms      
      #'macro-expand-pass
      #'inject-functions-pass
      #'compile-pass
      #'gen-in-arg-strings
      #'final-uniform-strings
      #'final-string-compose
      #'process-output
      #'code-obj->result-object)))


;;----------------------------------------------------------------------

;;[TODO] Move these errors
(defun check-arg-forms (in-args)
  (loop for stream in in-args :do 
       (when (or (not (every #'keywordp (cddr stream))) (< (length stream) 2))
         (error "Declaration ~a is badly formed.~%Should be (-var-name- -var-type- &optional qualifiers)" stream)))
  t)

(defun check-for-dups (in-vars uniforms)  
  (if (intersection (mapcar #'first in-vars) (mapcar #'first uniforms))
      (error "Varjo: Duplicates names found between in-vars and uniforms")
      t))

(defun split-input-into-env (args body env)
  (let* ((uni-pos (symbol-name-position '&uniform args))
         (context-pos (symbol-name-position '&context args))
         (in-vars (subseq args 0 (or uni-pos context-pos)))
         (uniforms (when uni-pos (subseq args (1+ uni-pos) context-pos)))
         (context (when context-pos (subseq args (1+ context-pos)))))
    (when (and (check-arg-forms uniforms) (check-arg-forms in-vars)
               (check-for-dups in-vars uniforms))
      (setf (v-raw-in-args env) in-vars)
      (setf (v-raw-uniforms env) uniforms)
      (setf (v-raw-context env) context)
      (values body env))))

;;----------------------------------------------------------------------

(defun process-in-args (code env)
  "Populate in-args and create fake-structs where they are needed"
  (let ((in-args (v-raw-in-args env)))
    (loop :for (name type . qualifiers) :in in-args :do
       (let* ((type-obj (type-spec->type type))
              (fake-struct (when (typep type 'v-struct)
                             (make-fake-struct type-obj env))))
         (add-var name
                  (make-instance 'v-value :type (if fake-struct 
                                                    'v-fake-struct
                                                    type))
                  env)
         (if fake-struct
             (loop :for (slot-name slot-type . acc) :in (v-slots fake-struct) 
                :do (push `(,(fake-slot-name slot-name) ,slot-type ,qualifiers) 
                          (v-in-args env)))
             (push `(,name ,(v-type-name type-obj) ,qualifiers) 
                   (v-in-args env)))))
    (values code env)))

;;----------------------------------------------------------------------

(defun process-uniforms (code env)
  (let ((uniforms (v-raw-uniforms env)))
    (loop :for (name type) :in uniforms :do
       (add-var name (make-instance 'v-value :type type) env))
    (values code env)))

;;----------------------------------------------------------------------

(defun v-macroexpand-all (code env)
  (cond ((atom code) code)
        (t (let* ((head (first code))
                  (m (get-macro head env))
                  (code (if m (apply m code) code)))
             (loop :for c :in code :collect (v-macroexpand-all c env))))))

(defun macroexpand-pass (code env)
  (values (v-macroexpand-all code env) env))

;;----------------------------------------------------------------------

(defun find-injected-functions (code env)
  (cond ((atom code) code)
        (t (let* ((head (first code))
                  (f (get-external-function head *global-env*)))
             (append (when f `(,head ,f))
                     (loop :for c :in code :if (listp c) :collect
                        (find-injected-functions c env)))))))

(defun inject-functions-pass (code env)
  (let ((injected-funcs (find-injected-functions code env)))
    (values `(labels (,@(loop :for (name f) :in injected-funcs :collect 
                           `(,name ,(v-glsl-string f))))
               ,@code)
            env)))

;;----------------------------------------------------------------------

(defun compile-pass (code env)  
  (values (varjo->glsl `(%make-function :main () ,@code) env)
          env))

;;----------------------------------------------------------------------

(defun gen-in-arg-strings () (values code env))
(defun final-uniform-strings () (values code env))
(defun final-string-compose () (values code env))
(defun process-output () (values code env))
(defun code-obj->result-object () (values code env))
