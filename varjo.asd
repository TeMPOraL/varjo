;;;; varjo.asd

(asdf:defsystem #:varjo
  :description "Common Lisp -> GLSL Compiler"
  :author "Chris Bagley (Baggers) <techsnuffle@gmail.com>"
  :license "BSD 2 Clause"
  #+asdf-unicode :encoding #+asdf-unicode :utf-8
  :serial t
  :depends-on (#:cl-ppcre #:split-sequence #:alexandria #:named-readtables
                          #:vas-string-metrics #:fn #:uiop
                          #:rtg-math #:glsl-spec)
  :components ((:file "package")
               (:file "utils-v")
               (:file "compiler/generics")
               (:file "compiler/globals")
               (:file "compiler/errors")
               (:file "compiler/names")
               (:file "compiler/internal-types")
               (:file "compiler/types")
               (:file "compiler/return-set")
               (:file "compiler/function-obj")
               (:file "compiler/deftype")
               (:file "compiler/code-object")
               (:file "compiler/stemcells")
               (:file "language/types")
               (:file "compiler/flow")
               (:file "compiler/variables")
               (:file "compiler/external-functions")
               (:file "compiler/environment")
               (:file "compiler/value-metadata")
               (:file "compiler/structs")
               (:file "compiler/macros")
               (:file "language/macros")
               (:file "compiler/functions")
               (:file "compiler/string-generation")
               (:file "compiler/compile-result")
               (:file "compiler/ast-node")
               (:file "compiler/compile-literal")
               (:file "compiler/compile-vars")
               (:file "compiler/compile-special")
               (:file "compiler/compile-funcall")
               (:file "compiler/compile-form")
               (:file "compiler/make-function")
               (:file "language/parse-from-spec")
               (:file "language/variables-from-spec")
               (:file "language/functions-from-spec")
               (:file "language/built-in-types")
               ;;
               (:file "language/special-operators/uint")
               (:file "language/special-operators/progn")
               (:file "language/special-operators/let")
               (:file "language/special-operators/assignment")
               (:file "language/special-operators/conditionals")
               (:file "language/special-operators/and-or")
               (:file "language/special-operators/declarations")
               (:file "language/special-operators/return")
               (:file "language/special-operators/values")
               (:file "language/special-operators/multiple-value-x")
               (:file "language/special-operators/local-functions")
               (:file "language/special-operators/function")
               (:file "language/special-operators/iteration")
               (:file "language/special-operators/macros")
               (:file "language/special-operators/swizzle")
               (:file "language/special-operators/inline-code")
               (:file "language/special-operators/compiler-debugging")
               (:file "language/special-operators/make-array")
               (:file "language/special-operators/aref")
               (:file "language/special-operators/emit")
               ;;
               (:file "language/functions")
               (:file "language/bitwise-operators")
               (:file "compiler/stages")
               (:file "compiler/translate")
               (:file "compiler/rolling-translate")
               (:file "compiler/front-end")
               (:file "compiler/environment/public-api")
               (:file "language/rtg-math-equivalents")))
