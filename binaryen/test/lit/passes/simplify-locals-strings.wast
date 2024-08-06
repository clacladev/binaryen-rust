;; NOTE: Assertions have been generated by update_lit_checks.py and should not be edited.
;; RUN: wasm-opt %s --simplify-locals -all -S -o - \
;; RUN:   | filecheck %s

(module
  (memory 10 10)

  ;; CHECK:      (type $array (sub (array (mut i8))))
  (type $array (sub (array (mut i8))))
  ;; CHECK:      (type $array16 (sub (array (mut i16))))
  (type $array16 (sub (array (mut i16))))

  ;; CHECK:      (func $no-new-past-store (type $2) (param $array (ref $array)) (param $array16 (ref $array16))
  ;; CHECK-NEXT:  (local $temp stringref)
  ;; CHECK-NEXT:  (local.set $temp
  ;; CHECK-NEXT:   (string.new_lossy_utf8_array
  ;; CHECK-NEXT:    (local.get $array)
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (array.set $array
  ;; CHECK-NEXT:   (local.get $array)
  ;; CHECK-NEXT:   (i32.const 3)
  ;; CHECK-NEXT:   (i32.const 4)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (local.get $temp)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (local.set $temp
  ;; CHECK-NEXT:   (string.new_wtf16_array
  ;; CHECK-NEXT:    (local.get $array16)
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (array.set $array
  ;; CHECK-NEXT:   (local.get $array)
  ;; CHECK-NEXT:   (i32.const 3)
  ;; CHECK-NEXT:   (i32.const 4)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (local.get $temp)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $no-new-past-store (param $array (ref $array)) (param $array16 (ref $array16))
    (local $temp stringref)
    ;; A string.new_***_array cannot be moved past a GC store.
    (local.set $temp
      (string.new_lossy_utf8_array
        (local.get $array)
        (i32.const 1)
        (i32.const 2)
      )
    )
    (array.set $array
      (local.get $array)
      (i32.const 3)
      (i32.const 4)
    )
    (drop
      (local.get $temp)
    )
    (local.set $temp
      (string.new_wtf16_array
        (local.get $array16)
        (i32.const 1)
        (i32.const 2)
      )
    )
    (array.set $array
      (local.get $array)
      (i32.const 3)
      (i32.const 4)
    )
    (drop
      (local.get $temp)
    )
  )

  ;; CHECK:      (func $yes-new-past-load (type $3) (param $array16 (ref $array16))
  ;; CHECK-NEXT:  (local $temp stringref)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (array.get_u $array16
  ;; CHECK-NEXT:    (local.get $array16)
  ;; CHECK-NEXT:    (i32.const 0)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (string.new_wtf16_array
  ;; CHECK-NEXT:    (local.get $array16)
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:    (i32.const 2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $yes-new-past-load (param $array16 (ref $array16))
    (local $temp stringref)
    ;; A string.new can be moved past an array load.
    (local.set $temp
      (string.new_wtf16_array
        (local.get $array16)
        (i32.const 1)
        (i32.const 2)
      )
    )
    (drop
      (array.get $array16
        (local.get $array16)
        (i32.const 0)
      )
    )
    (drop
      (local.get $temp)
    )
  )

  ;; CHECK:      (func $no-load-past-encode (type $4) (param $ref stringref) (param $array (ref $array)) (param $array16 (ref $array16))
  ;; CHECK-NEXT:  (local $temp i32)
  ;; CHECK-NEXT:  (local.set $temp
  ;; CHECK-NEXT:   (array.get_u $array
  ;; CHECK-NEXT:    (local.get $array)
  ;; CHECK-NEXT:    (i32.const 0)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (string.encode_lossy_utf8_array
  ;; CHECK-NEXT:    (local.get $ref)
  ;; CHECK-NEXT:    (local.get $array)
  ;; CHECK-NEXT:    (i32.const 10)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (local.get $temp)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (local.set $temp
  ;; CHECK-NEXT:   (array.get_u $array
  ;; CHECK-NEXT:    (local.get $array)
  ;; CHECK-NEXT:    (i32.const 0)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (string.encode_wtf16_array
  ;; CHECK-NEXT:    (local.get $ref)
  ;; CHECK-NEXT:    (local.get $array16)
  ;; CHECK-NEXT:    (i32.const 20)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (local.get $temp)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $no-load-past-encode (param $ref stringref) (param $array (ref $array)) (param $array16 (ref $array16))
    (local $temp i32)
    ;; string.encode_*_array writes to an array, so an array get can't be moved
    ;; past it.
    (local.set $temp
      (array.get $array
        (local.get $array)
        (i32.const 0)
      )
    )
    (drop
      (string.encode_lossy_utf8_array
        (local.get $ref)
        (local.get $array)
        (i32.const 10)
      )
    )
    (drop
      (local.get $temp)
    )
    (local.set $temp
      (array.get $array
        (local.get $array)
        (i32.const 0)
      )
    )
    (drop
      (string.encode_wtf16_array
        (local.get $ref)
        (local.get $array16)
        (i32.const 20)
      )
    )
    (drop
      (local.get $temp)
    )
  )
)