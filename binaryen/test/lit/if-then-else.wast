;; NOTE: Assertions have been generated by update_lit_checks.py and should not be edited.
;; RUN: wasm-opt %s -S -o - | filecheck %s

;; Check that an empty then or else clause is allowed.
(module
  ;; CHECK:      (func $test (param $0 i32) (result i32)
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (local.get $0)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (nop)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (else
  ;; CHECK-NEXT:    (return
  ;; CHECK-NEXT:     (i32.const 0)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (local.get $0)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (return
  ;; CHECK-NEXT:     (i32.const 1)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (else
  ;; CHECK-NEXT:    (nop)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (return
  ;; CHECK-NEXT:   (i32.const 2)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $test (param i32) (result i32)
    (if
       (local.get 0)
       (then)
       (else
          (return (i32.const 0))
       )
    )
    (if
       (local.get 0)
       (then
         (return
           (i32.const 1)
         )
       )
       (else)
    )
    (return
      (i32.const 2)
    )
  )
)