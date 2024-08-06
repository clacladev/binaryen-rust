;; NOTE: Assertions have been generated by update_lit_checks.py and should not be edited.

;; RUN: wasm-opt %s -all -S -o - \
;; RUN:   | filecheck %s

;; Test for non-nullable types in tuples

(module
  ;; CHECK:      (func $foo (type $0)
  ;; CHECK-NEXT:  (local $tuple (tuple (ref any) (ref any)))
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT: )
  (func $foo
    (local $tuple (tuple (ref any) (ref any)))
  )
)
