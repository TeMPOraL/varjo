(in-package :vari.glsl)

(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-uint v-uint) v-uint)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-int v-int) v-int)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-uvec2 v-uvec2) v-uvec2)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-uvec3 v-uvec3) v-uvec3)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-uvec4 v-uvec4) v-uvec4)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-ivec2 v-ivec2) v-ivec2)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-ivec3 v-ivec3) v-ivec3)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-ivec4 v-ivec4) v-ivec4)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-uint v-uvec2) v-uvec2)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-uint v-uvec3) v-uvec3)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-uint v-uvec4) v-uvec4)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-int v-ivec2) v-ivec2)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-int v-ivec3) v-ivec3)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-int v-ivec4) v-ivec4)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-uvec2 v-uint) v-uvec2)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-uvec3 v-uint) v-uvec3)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-uvec4 v-uint) v-uvec4)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-ivec2 v-int) v-ivec2)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-ivec3 v-int) v-ivec3)
(v-def-glsl-template-fun << (x y) "(~a << ~a)" (v-ivec4 v-int) v-ivec4)

(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-uint v-uint) v-uint)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-int v-int) v-int)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-uvec2 v-uvec2) v-uvec2)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-uvec3 v-uvec3) v-uvec3)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-uvec4 v-uvec4) v-uvec4)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-ivec2 v-ivec2) v-ivec2)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-ivec3 v-ivec3) v-ivec3)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-ivec4 v-ivec4) v-ivec4)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-uint v-uvec2) v-uvec2)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-uint v-uvec3) v-uvec3)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-uint v-uvec4) v-uvec4)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-int v-ivec2) v-ivec2)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-int v-ivec3) v-ivec3)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-int v-ivec4) v-ivec4)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-uvec2 v-uint) v-uvec2)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-uvec3 v-uint) v-uvec3)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-uvec4 v-uint) v-uvec4)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-ivec2 v-int) v-ivec2)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-ivec3 v-int) v-ivec3)
(v-def-glsl-template-fun >> (x y) "(~a >> ~a)" (v-ivec4 v-int) v-ivec4)
