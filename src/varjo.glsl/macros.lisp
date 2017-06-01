(in-package :vari.glsl)

(v-defmacro + (&rest numbers)
  (case= (length numbers)
    (0 0)
    (1 (first numbers))
    (2 `(%+ ,@numbers))
    (otherwise `(%+ ,(first numbers) (+ ,@(rest numbers))))))

(v-defmacro - (&rest numbers)
  (if (> (length numbers) 2)
      `(%- ,(first numbers) (- ,@(rest numbers)))
      `(%- ,@numbers)))

(v-defmacro * (&rest numbers)
  (case= (length numbers)
    (0 1)
    (1 (first numbers))
    (2 `(%* ,@numbers))
    (otherwise `(%* ,(first numbers) (* ,@(rest numbers))))))

(v-defmacro / (&rest numbers)
  (case= (length numbers)
    (1 (first numbers))
    (2 `(%/ ,@numbers))
    (otherwise `(%/ ,(first numbers) (/ ,@(rest numbers))))))

(v-defmacro = (&rest numbers)
  (if (> (length numbers) 2)
      `(%= ,(first numbers) (= ,@(rest numbers)))
      `(%= ,@numbers)))

(v-defmacro > (&rest numbers)
  (if (> (length numbers) 2)
      `(%> ,(first numbers) (> ,@(rest numbers)))
      `(%> ,@numbers)))

(v-defmacro < (&rest numbers)
  (if (> (length numbers) 2)
      `(%< ,(first numbers) (< ,@(rest numbers)))
      `(%< ,@numbers)))

(v-defmacro >= (&rest numbers)
  (if (> (length numbers) 2)
      `(%>= ,(first numbers) (>= ,@(rest numbers)))
      `(%>= ,@numbers)))

(v-defmacro <= (&rest numbers)
  (if (> (length numbers) 2)
      `(%<= ,(first numbers) (<= ,@(rest numbers)))
      `(%<= ,@numbers)))
