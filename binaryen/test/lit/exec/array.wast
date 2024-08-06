;; NOTE: Assertions have been generated by update_lit_checks.py --output=fuzz-exec and should not be edited.

;; RUN: wasm-opt %s -all --fuzz-exec -q -o /dev/null 2>&1 | filecheck %s

(module
 (type $array (array (mut i8)))

 (type $array-func (array (mut funcref)))

 (table $table 10 10 funcref)

 (elem $active (i32.const 0) $func)

 (elem $passive $func)

 ;; CHECK:      [fuzz-exec] calling func
 ;; CHECK-NEXT: [fuzz-exec] note result: func => 1
 (func $func (export "func") (result i32)
  ;; Verifies the order of execution is correct - we should return 1, not 2.
  (array.new $array
   (return (i32.const 1))
   (return (i32.const 2))
  )
 )

 ;; CHECK:      [fuzz-exec] calling new_active
 ;; CHECK-NEXT: [trap out of bounds segment access in array.new_elem]
 (func $new_active (export "new_active")
  ;; Even though this is reading 0 items, offset 1 is out of bounds in that
  ;; dropped element segment, and this traps.
  (drop
   (array.new_elem $array-func $active
    (i32.const 1)
    (i32.const 0)
   )
  )
 )

 ;; CHECK:      [fuzz-exec] calling new_active_in_bounds
 (func $new_active_in_bounds (export "new_active_in_bounds")
  ;; Even though this is dropped, we read 0 from offset 0, which is ok.
  (drop
   (array.new_elem $array-func $active
    (i32.const 0)
    (i32.const 0)
   )
  )
 )

 ;; CHECK:      [fuzz-exec] calling new_passive
 (func $new_passive (export "new_passive")
  ;; Using the passive segment here works.
  (drop
   (array.new_elem $array-func $passive
    (i32.const 1)
    (i32.const 0)
   )
  )
 )

 ;; CHECK:      [fuzz-exec] calling init_active
 ;; CHECK-NEXT: [trap out of bounds segment access in array.init_elem]
 (func $init_active (export "init_active")
  ;; Even though this is reading 0 items, offset 1 is out of bounds in that
  ;; dropped element segment, and this traps.
  (array.init_elem $array-func $active
   (array.new_default $array-func
    (i32.const 100)
   )
   (i32.const 50)
   (i32.const 1)
   (i32.const 0)
  )
 )

 ;; CHECK:      [fuzz-exec] calling init_active_in_bounds
 (func $init_active_in_bounds (export "init_active_in_bounds")
  ;; Even though this is dropped, we read 0 from offset 0, which is ok.
  (array.init_elem $array-func $active
   (array.new_default $array-func
    (i32.const 100)
   )
   (i32.const 50)
   (i32.const 0)
   (i32.const 0)
  )
 )

 ;; CHECK:      [fuzz-exec] calling init_passive
 (func $init_passive (export "init_passive")
  ;; This works ok.
  (array.init_elem $array-func $passive
   (array.new_default $array-func
    (i32.const 100)
   )
   (i32.const 50)
   (i32.const 1)
   (i32.const 0)
  )
 )
)
;; CHECK:      [fuzz-exec] calling func
;; CHECK-NEXT: [fuzz-exec] note result: func => 1

;; CHECK:      [fuzz-exec] calling new_active
;; CHECK-NEXT: [trap out of bounds segment access in array.new_elem]

;; CHECK:      [fuzz-exec] calling new_active_in_bounds

;; CHECK:      [fuzz-exec] calling new_passive

;; CHECK:      [fuzz-exec] calling init_active
;; CHECK-NEXT: [trap out of bounds segment access in array.init_elem]

;; CHECK:      [fuzz-exec] calling init_active_in_bounds

;; CHECK:      [fuzz-exec] calling init_passive
;; CHECK-NEXT: [fuzz-exec] comparing func
;; CHECK-NEXT: [fuzz-exec] comparing init_active
;; CHECK-NEXT: [fuzz-exec] comparing init_active_in_bounds
;; CHECK-NEXT: [fuzz-exec] comparing init_passive
;; CHECK-NEXT: [fuzz-exec] comparing new_active
;; CHECK-NEXT: [fuzz-exec] comparing new_active_in_bounds
;; CHECK-NEXT: [fuzz-exec] comparing new_passive