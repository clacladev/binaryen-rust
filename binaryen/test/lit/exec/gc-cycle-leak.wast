;; NOTE: Assertions have been generated by update_lit_checks.py --output=fuzz-exec and should not be edited.

;; RUN: wasm-opt %s -all --fuzz-exec -q -o /dev/null 2>&1 | filecheck %s

(module
 (type $A (struct (field (mut (ref null $A)))))

 ;; CHECK:      [fuzz-exec] calling test
 (func $test (export "test")
  (local $a (ref $A))
  ;; This function makes a self-cycle where the local $a's ref field points to
  ;; itself. This test checks that we do not error, even in sanitizers, when
  ;; such cycles are created (at the time of creating this test, we represent
  ;; GC data using std::shared_ptr, which does not handle cycles, and so by
  ;; default leak checks will error if not suppressed).
  (local.set $a
   (struct.new $A
    (ref.null $A)
   )
  )
  (struct.set $A 0
   (local.get $a)
   (local.get $a)
  )
 )
)
;; CHECK:      [fuzz-exec] calling test
;; CHECK-NEXT: [fuzz-exec] comparing test