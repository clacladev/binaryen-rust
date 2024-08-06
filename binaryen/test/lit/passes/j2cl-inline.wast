;; NOTE: Assertions have been generated by update_lit_checks.py --all-items and should not be edited.

;; RUN: foreach %s %t wasm-opt --optimize-j2cl --vacuum -all -S -o - | filecheck %s

;; Only trivial once functions are inlined
(module

  ;; A once function that has become empty
  ;; CHECK:      (type $0 (func))

  ;; CHECK:      (global $$class-initialized@Zoo (mut i32) (i32.const 0))

  ;; CHECK:      (func $clinit-trivial-1_<once>_@Foo (type $0)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT: )
  (func $clinit-trivial-1_<once>_@Foo  )

  ;; A once function that just calls another
  ;; CHECK:      (func $clinit-trivial-2_<once>_@Bar (type $0)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT: )
  (func $clinit-trivial-2_<once>_@Bar
    (call $clinit-trivial-1_<once>_@Foo)
  )

  (global $$class-initialized@Zoo (mut i32) (i32.const 0))

  ;; Not hoisted but trivial.
  ;; CHECK:      (func $clinit-non-trivial_<once>_@Zoo (type $0)
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (global.get $$class-initialized@Zoo)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (return)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (global.set $$class-initialized@Zoo
  ;; CHECK-NEXT:   (i32.const 1)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $clinit-non-trivial_<once>_@Zoo
    (if (global.get $$class-initialized@Zoo)
     (then
      (return)
     )
    )
    (global.set $$class-initialized@Zoo (i32.const 1))
  )

  ;; CHECK:      (func $main (type $0)
  ;; CHECK-NEXT:  (call $clinit-non-trivial_<once>_@Zoo)
  ;; CHECK-NEXT: )
  (func $main
    (call $clinit-trivial-1_<once>_@Foo)
    (call $clinit-trivial-2_<once>_@Bar)
    (call $clinit-non-trivial_<once>_@Zoo)
  )
)