;; NOTE: Assertions have been generated by update_lit_checks.py --all-items and should not be edited.
;; RUN: foreach %s %t wasm-opt --closed-world -tnh --type-merging --remove-unused-types -all -S -o - | filecheck %s

;; ref.cast does not inhibit merging if traps never happen.
(module
  ;; CHECK:      (rec
  ;; CHECK-NEXT:  (type $A (sub (struct )))
  (type $A (sub (struct)))
  (type $B (sub $A (struct)))

  ;; CHECK:       (type $1 (func (param (ref $A)) (result (ref $A))))

  ;; CHECK:      (func $test (type $1) (param $a (ref $A)) (result (ref $A))
  ;; CHECK-NEXT:  (ref.cast (ref $A)
  ;; CHECK-NEXT:   (local.get $a)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $test (param $a (ref $A)) (result (ref $B))
    (ref.cast (ref $B)
      (local.get $a)
    )
  )
)

;; Check that a ref.test still inhibits merging with -tnh.
(module
  ;; CHECK:      (rec
  ;; CHECK-NEXT:  (type $A (sub (struct )))
  (type $A (sub (struct)))
  ;; CHECK:       (type $B (sub $A (struct )))
  (type $B (sub $A (struct)))

  ;; CHECK:       (type $2 (func (param (ref $A)) (result i32)))

  ;; CHECK:      (func $test (type $2) (param $a (ref $A)) (result i32)
  ;; CHECK-NEXT:  (ref.test (ref $B)
  ;; CHECK-NEXT:   (local.get $a)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $test (param $a (ref $A)) (result i32)
    (ref.test (ref $B)
      (local.get $a)
    )
  )
)

;; Check that a br_on_cast still inhibits merging with -tnh.
(module
  ;; CHECK:      (rec
  ;; CHECK-NEXT:  (type $A (sub (struct )))
  (type $A (sub (struct)))
  ;; CHECK:       (type $B (sub $A (struct )))
  (type $B (sub $A (struct)))

  ;; CHECK:       (type $2 (func (param (ref $A)) (result (ref $B))))

  ;; CHECK:      (func $test (type $2) (param $a (ref $A)) (result (ref $B))
  ;; CHECK-NEXT:  (block $label (result (ref $B))
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (br_on_cast $label (ref $A) (ref $B)
  ;; CHECK-NEXT:     (local.get $a)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (block $l (result (ref $A))
  ;; CHECK-NEXT:     (br_on_non_null $l
  ;; CHECK-NEXT:      (local.get $a)
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:     (unreachable)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (unreachable)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $test (param $a (ref $A)) (result (ref $B))
    (drop
      (br_on_cast 0 anyref (ref $B)
        (local.get $a)
      )
    )
    ;; Also check that a different br_on* doesn't confuse us.
    (drop
      (block $l (result (ref $A))
        (br_on_non_null $l
          (local.get $a)
        )
        (unreachable)
      )
    )
    (unreachable)
  )
)

;; call_indirect should not inhibit merging if traps never happen.
(module
  ;; CHECK:      (type $A (sub (func)))
  (type $A (sub (func)))
  (type $B (sub $A (func)))

  (table 1 1 (ref null $A))

  ;; CHECK:      (table $0 1 1 (ref null $A))

  ;; CHECK:      (func $test (type $A)
  ;; CHECK-NEXT:  (call_indirect $0 (type $A)
  ;; CHECK-NEXT:   (i32.const 0)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $test (type $A)
    (call_indirect (type $B)
      (i32.const 0)
    )
  )
)