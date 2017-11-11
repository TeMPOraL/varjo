(uiop:define-package #:varjo.utils
    (:use #:cl #:alexandria #:named-readtables)
  (:export
   :case-member
   :case=
   :dbind
   :pipe->
   :vbind
   :vlist
   :assocr
   :cons-end
   :elt*
   :find-duplicates
   :find-similarly-named-symbol
   :group
   :group-by
   :kwd
   :lambda-list-get-names
   :lambda-list-split
   :last1
   :listify
   :n-of
   :p-symb
   :positions-if
   :split-arguments
   :symb
   :a-get
   :a-get1
   :a-add
   :a-set
   :a-remove-all))

(uiop:define-package #:vari.types
    (:use #:cl #:varjo.utils #:alexandria #:named-readtables)
  (:export :v-type
           :v-stemcell
           :v-shadow-type
           :v-ephemeral-type
           :v-ephemeral-array
           :v-unrepresentable-value
           :v-block-array
           :v-or
           :v-any-one-of
           :v-error
           ;;
           :v-container
           :v-array
           :v-number
           :v-vector
           :v-fvector
           :v-bvector
           :v-uvector
           :v-ivector
           :v-dvector
           :v-matrix
           :v-dmatrix
           :v-dmat4x4
           :v-struct
           :v-user-struct
           :v-sampler
           ;;
           :v-function-type
           :v-user-function
           ;;
           :v-void
           :v-bool
           :v-int
           :v-uint
           :v-float
           :v-short-float
           :v-double
           :v-mat2
           :v-mat3
           :v-mat4
           :v-dmat2
           :v-dmat2x2
           :v-dmat2x3
           :v-dmat2x4
           :v-dmat3
           :v-dmat3x2
           :v-dmat3x3
           :v-dmat3x4
           :v-dmat4
           :v-dmat4x2
           :v-dmat4x3
           :v-mat2x2
           :v-mat2x3
           :v-mat2x4
           :v-mat3x2
           :v-mat3x3
           :v-mat3x4
           :v-mat4x2
           :v-mat4x3
           :v-mat4x4
           :v-vec2
           :v-vec3
           :v-vec4
           :v-bvec2
           :v-bvec3
           :v-bvec4
           :v-uvec2
           :v-uvec3
           :v-uvec4
           :v-ivec2
           :v-ivec3
           :v-ivec4
           :v-dvec2
           :v-dvec3
           :v-dvec4
           :v-isampler-1d
           :v-isampler-1d-array
           :v-isampler-2d
           :v-isampler-2d-array
           :v-isampler-2d-ms
           :v-isampler-2d-ms-array
           :v-isampler-2d-rect
           :v-isampler-3d
           :v-isampler-buffer
           :v-isampler-cube
           :v-isampler-cube-array
           :v-sampler-1d
           :v-sampler-1d-array
           :v-sampler-1d-array-shadow
           :v-sampler-1d-shadow
           :v-sampler-2d
           :v-sampler-2d-array
           :v-sampler-2d-array-shadow
           :v-sampler-2d-ms
           :v-sampler-2d-ms-array
           :v-sampler-2d-rect
           :v-sampler-2d-rect-shadow
           :v-sampler-2d-shadow
           :v-sampler-3d
           :v-sampler-buffer
           :v-sampler-cube
           :v-sampler-cube-array
           :v-sampler-cube-array-shadow
           :v-sampler-cube-shadow
           :v-usampler-1d
           :v-usampler-1d-array
           :v-usampler-2d
           :v-usampler-2d-array
           :v-usampler-2d-ms
           :v-usampler-2d-ms-array
           :v-usampler-2d-rect
           :v-usampler-3d
           :v-usampler-buffer
           :v-usampler-cube
           :v-usampler-cube-array
           :v-usampler-rect
           :v-isampler-rect
           :v-sampler-rect
           ;;
           :v-atomic-uint
           ;;
           :v-uimage-buffer
           :v-iimage-buffer
           :v-buffer-image
           :v-ibuffer-image
           :v-iimage-1d
           :v-iimage-1d-array
           :v-iimage-2d
           :v-iimage-2d-array
           :v-iimage-2d-ms
           :v-iimage-2d-ms-array
           :v-iimage-2d-rect
           :v-iimage-3d
           :v-iimage-cube
           :v-iimage-cube-array
           :v-iimage-rect
           :v-image-1d
           :v-image-1d-array
           :v-image-2d
           :v-image-2d-array
           :v-image-2d-ms
           :v-image-2d-ms-array
           :v-image-2d-rect
           :v-image-3d
           :v-image-buffer
           :v-image-cube
           :v-image-cube-array
           :v-image-rect
           :v-ubuffer-image
           :v-uimage-1d
           :v-uimage-1d-array
           :v-uimage-2d
           :v-uimage-2d-array
           :v-uimage-2d-ms
           :v-uimage-2d-ms-array
           :v-uimage-2d-rect
           :v-uimage-3d
           :v-uimage-cube
           :v-uimage-cube-array
           :v-uimage-rect))

;;;; package.lisp
(uiop:define-package #:varjo-conditions
    (:use #:cl #:varjo.utils #:alexandria #:named-readtables)
  (:export :problem-with-the-compiler
           :cannot-compile
           :invalid-form-list
           :no-function-returns
           :not-core-type-error
           :invalid-function-return-spec
           :unknown-type-spec
           :duplicate-name
           :clone-global-env-error
           :cannot-swizzle-this-type
           :clean-global-env-error
           :could-not-find-function
           :could-not-find-any
           :no-valid-function
           :return-type-mismatch
           :emit-type-mismatch
           :non-place-assign
           :setq-readonly
           :assigning-to-readonly
           :assignment-type-match
           :setq-type-match
           :cannot-not-shadow-core
           :out-var-name-taken
           :unknown-variable-type
           :var-type-mismatch
           :switch-type-error
           :loop-will-never-halt
           :for-loop-simple-expression
           :for-loop-only-one-var
           :invalid-for-loop-type
           :no-version-in-context
           :name-unsuitable
           :unable-to-resolve-func-type
           :out-var-type-mismatch
           :fake-type-global
           :invalid-context-symbol
           :args-incompatible
           :invalid-shader-stage
           :swizzle-keyword
           :multi-func-stemcells
           :uniform-in-sfunc
           :invalid-v-defun-template
           :keyword-in-function-position
           :invalid-symbol-macro-form
           :stage-order-error
           :multi-val-bind-mismatch
           :merge-env-func-scope-mismatch
           :merge-env-parent-mismatch
           :env-parent-context-mismatch
           :symbol-unidentified
           :if-form-type-mismatch
           :bad-make-function-args
           :none-type-in-out-vars
           :body-block-empty
           :flow-ids-mandatory
           :flow-id-must-be-specified-vv
           :flow-id-must-be-specified-co
           :multiple-flow-ids-regular-func
           :if-branch-type-mismatch
           :if-test-type-mismatch
           :cross-scope-mutate
           :illegal-implicit-args
           :invalid-flow-id-multi-return
           :loop-flow-analysis-failure
           :invalid-env-vars
           :values-safe-wasnt-safe
           :empty-progn
           :name-clash
           :name-mismatch
           :function-with-no-return-type
           :external-function-invalid-in-arg-types
           :invalid-special-function-arg-spec
           :closures-not-supported
           :cannot-establish-exact-function
           :dup-name-in-let
           :dup-names-in-let
           :uninitialized-var
           :global-uninitialized-var
           :nil-return-set
           :with-fresh-env-scope-missing-env
           :vertex-stage-primary-type-mismatch
           :multi-dimensional-array
           :make-array-mandatory-args
           :make-array-conflicting-args
           :make-array-conflicting-lengths
           :make-array-cant-cast-args
           :make-array-cant-establish-default-value
           :should-be-quoted
           :should-be-constant
           :stage-in-context
           :invalid-stage-kind
           :invalid-primitive-for-geometry-stage
           :rolling-translate-invalid-stage
           :couldnt-convert-primitive-for-geometry-stage
           :test-translate-failed
           :returns-in-geometry-stage
           :primitives-dont-match
           :tessellation-control-expects-patches
           :tessellation-evaluation-invalid-primitive
           :emit-not-in-geometry-stage
           :inline-glsl-vertex-stage-not-supported
           :clashes-found-between-input-and-output-names
           :user-func-invalid-x
           :invalid-inline-glsl-stage-arg-layout
           :return-set-mismatch
           :funcall-of-special-operator
           :slot-value-on-non-struct
           :slot-not-found
           :v-def-template-arg-mismatch
           :cannot-take-reference-to-&rest-func
           :illegal-&rest-in-args
           :attempted-transform-feedback-in-fragment-shader
           :transform-feedback-incorrect-stage
           :invalid-feedback-qualifier-form

           ;; restarts
           :setq-supply-alternate-type
           :allow-call-function-signature))

(uiop:define-package #:varjo.internals
    (:use #:cl #:varjo.utils #:vari.types #:split-sequence
          #:alexandria
          #:cl-ppcre #:named-readtables #:varjo-conditions)
  (:export :%gen-assignment-string
           :%glsl-decl
           :%merge-multi-env-progn
           :%synthesize
           :%values-for-return
           :*ast-node-kinds*
           :*default-version*
           :*draw-modes*
           :*emit-var-name-base*
           :*global-env*
           :*return-var-name-base*
           :*stage-names*
           :*stage-type-names*
           :*supported-draw-modes*
           :*supported-versions*
           :*valid-contents-symbols*
           :%uniform-name
           :a-add
           :add-alternate-type-name
           :add-equivalent-name
           :add-external-function
           :add-form-binding
           :add-symbol-binding
           :add-type-to-stemcell-code
           :all-functions
           :allows-stemcellsp
           :args
           :arg-num
           :arguments
           :ast
           :ast->code
           :ast-args
           :ast-ending-env
           :ast-flow-id-origin
           :ast-kind
           :ast-node!
           :ast-parent
           :ast-return-type
           :ast-starting-env
           :ast-val-origin
           :base-environment
           :binding-accesible-p
           :block-name
           :block-name-string
           :build-function
           :calc-place-tree
           :captured-vars
           :cast-for-array-literal
           :checkpoint-flow-ids
           :code
           :combine-metadata
           :compile-declares
           :compile-external-func-returning-ref
           :compile-form
           :compile-forms-not-propagating-env-returning-list-of-compiled
           :compile-forms-propagating-env-returning-list-of-compiled
           :compile-let
           :compile-list-form
           :compile-literal
           :compile-place
           :compile-progn
           :compiled
           :compiled-stage
           :compiled-vertex-stage
           :compiled-tessellation-control-stage
           :compiled-tessellation-evaluation-stage
           :compiled-geometry-stage
           :compiled-fragment-stage
           :compiler-macro-expansion-environment
           :context
           :copy-ast-node
           :copy-compiled
           :core-typep
           :cpu-side-transform
           :current-line
           :def-metadata-infer
           :def-metadata-kind
           :def-shadow-type-constructor
           :default-value
           :delete-external-function
           :dynamic
           :emit-set
           :end-line
           :end-line-str
           :env
           :env->
           :env-depth
           :env-merge-history
           :env-prune*
           :env-replace-parent
           :ephemeral-p
           :expanded-input-variables
           :expansion
           :ext-func-compile-chain
           :external-function
           :external-function-p
           :extract-declares
           :extract-value-qualifiers
           :extended-environment
           :find-env-bindings
           :find-form-binding-by-literal
           :find-mutual-cast-type
           :flow-id!
           :flow-identifier
           :flow-ids
           :flow-id-scope
           :format-external-func-for-error
           :fragment-stage
           :fresh-env
           :fresh-environment
           :func
           :function-asts
           :function-obj
           :functions
           :gen-array-literal-string
           :gen-bin-op-string
           :gen-bool-and-string
           :gen-bool-or-string
           :gen-for-loop-string
           :gen-macro-function-code
           :gen-or-type
           :gen-setq-assignment-string
           :gen-switch-string
           :gen-swizzle-string
           :gen-while-string
           :geometry-stage
           :get-primitive-type-from-context
           :get-stage-kind-from-context
           :get-stemcell-name-for-flow-id
           :get-symbol-binding
           :glsl-code
           :glsl-name
           :glsl-string
           :glsl-to-compile-result
           :glsl-versions
           :id=
           :ids
           :id~=
           :implicit-args
           :implicit-return
           :implicit-uniforms
           :in-arg-flow-ids
           :in-args
           :in-declarations
           :in-out-args
           :indent-for-block
           :inject-implicit-uniform
           :input-variable-glsl
           :input-variables
           :line-loop
           :line-strip
           :line-strip-adjacency
           :lines
           :lines-adjacency
           :lisp-code
           :lisp-name
           :lisp-name->glsl-name
           :location
           :macro-expansion-environment
           :main-metadata
           :make-ast-node-for-declaration
           :make-compiled
           :make-dummy-function-from-type
           :make-function-set
           :make-regular-macro
           :make-stage
           :make-symbol-macro
           :make-type-set
           :make-type-set*
           :merge-compiled
           :merge-multi-env-progn
           :merge-progn
           :metadata-for-flow-id
           :macro-obj
           :name
           :node-tree
           :nth-return-name
           :origin-env
           :out-declarations
           :out-of-scope-args
           :out-set
           :output-variable-glsl
           :output-variables
           :p-env
           :patches
           :place-tree
           :points
           :postfix-glsl-index
           :prefix-type-to-string
           :previous-stage
           :primary-type
           :primitive
           :primitive-in
           :primitive-name-to-instance
           :primitive-out
           :pure-p
           :quads
           :qualifiers
           :qualifier
           :feedback-qualifier
           :feedback-group
           :qualify-type
           :raw-out-set
           :replace-flow-id
           :replace-flow-ids
           :reset-flow-ids-to-checkpoint
           :resolve-name-from-alternative
           :return-set
           :rolling-translate
           :safe-glsl-name-string
           :score
           :secondary-score
           :set-flow-id
           :signatures
           :stage
           :stage-where-first-return-is-position-p
           :starting-stage
           :stemcellp
           :stemcells
           :stemcells-allowed
           :swizzlable-p
           :tessellation-control-stage
           :tessellation-evaluation-stage
           :test-translate-function-split-details
           :to-arg-form
           :to-block
           :top-level-scoped-metadata
           :translate
           :triangle-fan
           :triangle-strip
           :triangle-strip-adjacency
           :triangles
           :triangles-adjacency
           :try-compile-arg
           :type->type-spec
           :type-set
           :type-set-to-type-list
           :type-sets-equal
           :type-spec->type
           :type-specp
           :uniform-variables
           :uniforms
           :used-external-functions
           :used-types
           :used-user-structs
           :user-function-p
           :v-allowed-outer-vars
           :v-argument-spec
           :v-array-type-of
           :v-casts-to
           :v-casts-to-p
           :v-code
           :v-compile
           :v-context
           :v-def-glsl-template-fun
           :v-define-compiler-macro
           :v-defmacro
           :v-defspecial
           :v-defstruct
           :v-deftype
           :v-defun
           :v-dimensions
           :v-element-type
           :v-errorp
           :v-form-bindings
           :v-function
           :v-function-scope
           :v-function-set
           :v-glsl-size
           :v-glsl-string
           :v-macro-function
           :v-macros
           :v-make-value
           :v-multi-val-base
           :v-multi-val-safe
           :v-parent-env
           :v-place-index
           :v-primary-type-eq
           :v-read-only
           :v-regular-macro
           :v-return-spec
           :v-slots
           :v-special-functionp
           :v-symbol-bindings
           :v-symbol-macro
           :v-type-eq
           :v-type-of
           :v-typep
           :v-uniforms
           :v-value
           :v-versions
           :v-voidp
           :values-safe
           :vec-of
           :vertex-count
           :vertex-stage
           :with-constant-inject-hook
           :with-fresh-env-scope
           :with-stemcell-infer-hook
           :with-v-arg
           :with-v-let-spec
           :parse-qualifier
           :*in-qualifier*
           :*out-qualifier*))

(uiop:define-package #:varjo.api
    (:use #:cl #:varjo.utils #:varjo.internals #:alexandria #:named-readtables)
  (:export
   ;;
   ;; globals
   :*ast-node-kinds*
   :*default-version*
   :*draw-modes*
   :*stage-names*
   :*stage-type-names*
   :*supported-draw-modes*
   :*supported-versions*
   :*valid-contents-symbols*
   ;;
   ;; stages
   :vertex-stage
   :tessellation-control-stage
   :tessellation-evaluation-stage
   :geometry-stage
   :fragment-stage
   ;;
   ;; primitives, draw-modes, etc
   :dynamic
   :line-loop
   :line-strip
   :line-strip-adjacency
   :lines
   :lines-adjacency
   :patches
   :points
   :quads
   :triangle-fan
   :triangle-strip
   :triangle-strip-adjacency
   :triangles
   :triangles-adjacency
   :vertex-count
   ;;
   ;; functions/macros
   :v-defun
   :v-def-glsl-template-fun
   :add-equivalent-name
   :v-defmacro
   :v-define-compiler-macro
   :v-defstruct
   :add-external-function
   :delete-external-function
   ;;
   ;; types
   :v-deftype
   :def-shadow-type-constructor
   :type-specp
   :type->type-spec
   :type-spec->type
   :v-type-eq
   :v-typep
   :v-casts-to-p
   :v-casts-to
   :find-mutual-cast-type
   :v-special-functionp
   :v-element-type
   :v-errorp
   :add-alternate-type-name
   :resolve-name-from-alternative
   :ephemeral-p
   :core-typep
   :make-type-set
   :def-metadata-infer
   :def-metadata-kind
   :combine-metadata
   :v-dimensions
   :qualifier
   :feedback-qualifier
   :feedback-group
   ;;
   ;; environment
   :add-lisp-form-as-uniform
   :all-bound-symbols
   :all-symbol-binding-names
   :argument-is-uniform-p
   :argument-type
   :argument-uniform-name
   :metadata-for-argument
   :metadata-for-variable
   :variable-in-scope-p
   :variable-is-uniform-p
   :variable-type
   :variable-uniform-name
   :variables-in-scope
   ;;
   ;; stages
   :make-stage
   :lisp-code
   :input-variables
   :uniform-variables
   :context
   :stemcells-allowed
   :primitive-in
   ;;
   ;; compilation
   :translate
   :rolling-translate
   :v-compile
   ;;
   ;; test compilation
   :test-translate-function-split-details
   ;;
   ;; compiled stages
   :compiled-stage
   :compiled-vertex-stage
   :compiled-tessellation-control-stage
   :compiled-tessellation-evaluation-stage
   :compiled-geometry-stage
   :compiled-fragment-stage
   :glsl-code
   :output-variables
   :implicit-uniforms
   :used-external-functions
   :primitive-out
   :ast->code
   :block-name-string
   ;;
   ;; compiled vars
   :name
   :qualifiers
   :glsl-name
   :v-type-of
   :location
   :v-glsl-size
   :cpu-side-transform
   ;;
   ;; hooks
   :with-stemcell-infer-hook
   :with-constant-inject-hook
   ;;
   ;; to sort
   :lisp-name))

(uiop:define-package #:vari.glsl
    (:use #:cl #:varjo.utils #:varjo.internals #:vari.types
          #:named-readtables #:glsl-symbols #:varjo-conditions)
  (:import-from :varjo.internals
                :def-v-type-class)
  (:reexport :vari.types)
  (:reexport :glsl-symbols)
  (:export
   ;; bitwise operators
   :>>
   :<<

   ;; functions
   :atomic-counter
   :bool
   :double
   :int
   :uint
   :v-equal
   :v-not
   :v-not-equal

   ;; struct slot names
   :near
   :far
   :diff

   ;; special operators
   :switch
   :for
   :while

   ;; vector constructors {TODO} move to glsl-spec
   :vec3
   :vec4
   :vec2
   :bvec3
   :bvec4
   :bvec2
   :ivec2
   :ivec3
   :ivec4
   :uvec3
   :uvec4
   :uvec2
   :dvec3
   :dvec4
   :dvec2
   :dvec4

   ;; matrix constructors {TODO} move to glsl-spec
   :mat2
   :mat3
   :mat4

   ;; things not in glsl-spec
   :gl-in))

(uiop:define-package #:vari.cl
    (:use #:cl #:varjo.utils #:vari.glsl #:varjo.internals
          #:named-readtables #:varjo-conditions)
  (:import-from :alexandria
                :ensure-list
                :flatten
                :iota)
  (:import-from :varjo.internals
                :def-v-type-class)
  (:reexport :vari.types :vari.glsl)
  (:export
   ;; special functions
   :labels-no-implicit
   :swizzle
   :%break
   :%peek
   :glsl-expr
   :lisp-code-as-uniform

   :emit-data
   :emit
   :multf
   :divf
   :v-defun
   :v-def-glsl-template-fun
   :v-defmacro
   :v-define-compiler-macro
   :v-defstruct
   :v-deftype
   :def-metadata-infer
   :def-metadata-kind

   :output-primitive
   :kind
   :max-vertices
   :output-patch
   :vertices
   :tessellate-to
   :primitive
   :spacing
   :order))

(uiop:define-package #:vari
    (:use #:vari.types #:vari.glsl #:vari.cl)
  (:reexport :vari.types :vari.glsl :vari.cl))

(uiop:define-package #:varjo
    (:use #:cl #:varjo.utils #:vari.types #:varjo.api
          #:alexandria #:named-readtables)
  (:reexport :vari.types :varjo.api))
