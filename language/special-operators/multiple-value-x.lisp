(in-package :varjo)
(in-readtable fn:fn-reader)

;;------------------------------------------------------------
;; Bind

(v-defspecial multiple-value-bind (vars value-form &rest body)
  :args-valid t
  :return
  (let* ((base (lisp-name->glsl-name 'mvb env))
         (new-env (fresh-environment env :multi-val-base base)))
    (let ((value-obj (compile-form value-form new-env)))
      (unless (= (length vars) (length (type-set value-obj)))
        (error 'multi-val-bind-mismatch
               :val-form value-form
               :bindings vars
               :return-set (type-set value-obj)))
      (let ((types (type-set-to-type-list (type-set value-obj))))
        (vbind ((m-objs s-obj b-objs) final-env)
            (with-fresh-env-scope (fresh-env env)
              (env-> (p-env fresh-env)
                (%mapcar-multi-env-progn
                 (lambda (env type name i)
                   (compile-let name (type->type-spec type) nil env
                                (postfix-glsl-index base i)))
                 p-env types vars (iota (length types)))
                (compile-form `(setq ,(first vars) ,value-obj) p-env)
                (compile-progn body p-env)))
          (let* ((m-obj (%merge-multi-env-progn m-objs))
                 (merged (merge-progn `(,m-obj ,s-obj ,@b-objs)
                                      env final-env)))
            (values
             (copy-compiled
              merged
              :node-tree (ast-node! 'multiple-value-bind
                                    `(,vars ,(node-tree value-obj)
                                            ,@(mapcar #'node-tree b-objs))
                                    (make-type-set (primary-type merged))
                                    env final-env))
             final-env)))))))

;;------------------------------------------------------------
;; Call

(v-defspecial multiple-value-call (function &rest value-forms)
  ;; {TODO} extend to multiple forms
  :args-valid t
  :return
  (vbind (func-obj fenv) (compile-form function env)
    (warn "before shipping this make all those extra tests works")
    (let ((bases (loop :for nil :in value-forms :collect
                    (lisp-name->glsl-name 'mvb fenv))))
      (vbind (value-objs v-env)
          (mapcar-progn (lambda (env form base)
                          (compile-form form (fresh-environment
                                              env :multi-val-base base)))
                        fenv
                        value-forms
                        bases)
        (let* ((types-grouped (mapcar #'type-set-to-type-list
                                      (mapcar #'type-set value-objs)))
               (types (flatten (types-grouped)))
               (names (loop :for nil :in types :collect (gensym)))
               (glsl-names (loop :for b :in bases :append
                              (loop :for x :in ))))
          (vbind ((m-objs s-obj b-obj) final-env)
              (with-fresh-env-scope (fresh-env fenv)
                (env-> (p-env fresh-env)
                  (%mapcar-multi-env-progn
                   (lambda (env type name i)
                     (compile-let name (type->type-spec type) nil env
                                  (postfix-glsl-index (first bases) i)))
                   p-env types names (iota (length types)))
                  (compile-form `(progn ,@(loop :for n :in names
                                             :for v :in value-objs
                                             :collect `(setq ,n ,v)))
                                p-env)
                  (compile-form `(funcall ,function ,@names) p-env)))
            (let* ((m-obj (%merge-multi-env-progn m-objs))
                   (merged (merge-progn `(,m-obj ,s-obj ,b-obj)
                                        env final-env)))
              (values
               (copy-compiled
                merged
                :node-tree (ast-node! 'multiple-value-bind
                                      `(,(node-tree func-obj)
                                         (node-tree b-obj))
                                      (make-type-set (primary-type merged))
                                      env final-env))
               final-env))))))))
