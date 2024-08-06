;; NOTE: Assertions have been generated by update_lit_checks.py and should not be edited.

;; RUN: wasm-opt %s -all -S -o - | filecheck %s
;; RUN: wasm-opt %s -all --roundtrip -S -o - | filecheck %s

(module
  (rec
    ;; CHECK:      (rec
    ;; CHECK-NEXT:  (type $super-struct (sub (struct (field i32))))
    (type $super-struct (sub (struct i32)))
    ;; CHECK:       (type $sub-struct (sub $super-struct (struct (field i32) (field i64))))
    (type $sub-struct (sub $super-struct (struct i32 i64)))
  )

  (rec
    ;; CHECK:      (rec
    ;; CHECK-NEXT:  (type $super-array (sub (array (ref $super-struct))))
    (type $super-array (sub (array (ref $super-struct))))
    ;; CHECK:       (type $sub-array (sub $super-array (array (ref $sub-struct))))
    (type $sub-array (sub $super-array (array (ref $sub-struct))))
  )

  (rec
    ;; CHECK:      (rec
    ;; CHECK-NEXT:  (type $super-func (sub (func (param (ref $sub-array)) (result (ref $super-array)))))
    (type $super-func (sub (func (param (ref $sub-array)) (result (ref $super-array)))))
    ;; CHECK:       (type $sub-func (sub $super-func (func (param (ref $super-array)) (result (ref $sub-array)))))
    (type $sub-func (sub $super-func (func (param (ref $super-array)) (result (ref $sub-array)))))
  )

  ;; CHECK:      (func $make-super-struct (type $4) (result (ref $super-struct))
  ;; CHECK-NEXT:  (call $make-sub-struct)
  ;; CHECK-NEXT: )
  (func $make-super-struct (result (ref $super-struct))
    (call $make-sub-struct)
  )

  ;; CHECK:      (func $make-sub-struct (type $5) (result (ref $sub-struct))
  ;; CHECK-NEXT:  (unreachable)
  ;; CHECK-NEXT: )
  (func $make-sub-struct (result (ref $sub-struct))
    (unreachable)
  )

  ;; CHECK:      (func $make-super-array (type $6) (result (ref $super-array))
  ;; CHECK-NEXT:  (call $make-sub-array)
  ;; CHECK-NEXT: )
  (func $make-super-array (result (ref $super-array))
    (call $make-sub-array)
  )

  ;; CHECK:      (func $make-sub-array (type $7) (result (ref $sub-array))
  ;; CHECK-NEXT:  (unreachable)
  ;; CHECK-NEXT: )
  (func $make-sub-array (result (ref $sub-array))
    (unreachable)
  )

  ;; CHECK:      (func $make-super-func (type $10) (result (ref $super-func))
  ;; CHECK-NEXT:  (call $make-sub-func)
  ;; CHECK-NEXT: )
  (func $make-super-func (result (ref $super-func))
    (call $make-sub-func)
  )

  ;; CHECK:      (func $make-sub-func (type $11) (result (ref $sub-func))
  ;; CHECK-NEXT:  (unreachable)
  ;; CHECK-NEXT: )
  (func $make-sub-func (result (ref $sub-func))
    (unreachable)
  )
)