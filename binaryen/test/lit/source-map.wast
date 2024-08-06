;; NOTE: Assertions have been generated by update_lit_checks.py --all-items and should not be edited.

;; RUN: wasm-opt %s -o %t.wasm -osm %t.map -g -q
;; RUN: wasm-opt %t.wasm -ism %t.map -q -o - -S | filecheck %s

;; Also test with StackIR, which should have identical results.
;;
;; RUN: wasm-opt %s --generate-stack-ir -o %t.wasm -osm %t.map -g -q
;; RUN: wasm-opt %t.wasm -ism %t.map -q -o - -S | filecheck %s

(module
  ;;@ src.cpp:0:1
  ;; CHECK:      (type $0 (func))

  ;; CHECK:      (type $1 (func (param i32 i32)))

  ;; CHECK:      (func $foo (param $x i32) (param $y i32)
  ;; CHECK-NEXT:  ;;@ src.cpp:10:1
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   ;;@ src.cpp:20:1
  ;; CHECK-NEXT:   (i32.add
  ;; CHECK-NEXT:    ;;@ src.cpp:30:1
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:    ;;@ src.cpp:40:1
  ;; CHECK-NEXT:    (local.get $y)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    ;;@ src.cpp:50:1
  ;; CHECK-NEXT:    (return)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  ;;@ src.cpp:60:1
  ;; CHECK-NEXT:  (call $foo
  ;; CHECK-NEXT:   ;;@ src.cpp:70:1
  ;; CHECK-NEXT:   (local.get $x)
  ;; CHECK-NEXT:   ;;@ src.cpp:80:1
  ;; CHECK-NEXT:   (local.get $y)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  ;;@ src.cpp:90:1
  ;; CHECK-NEXT: )
  (func $foo (param $x i32) (param $y i32)
    ;;@ src.cpp:10:1
    (if
      ;;@ src.cpp:20:1
      (i32.add
        ;;@ src.cpp:30:1
        (local.get $x)
        ;;@ src.cpp:40:1
        (local.get $y)
      )
      ;; For the legacy parser
      ;;@ src.cpp:50:1
      (then
        ;; For the new parser
        ;;@ src.cpp:50:1
        (return)
      )
    )
    ;;@ src.cpp:60:1
    (call $foo
      ;;@ src.cpp:70:1
      (local.get $x)
      ;;@ src.cpp:80:1
      (local.get $y)
    )
    ;;@ src.cpp:90:1
  )

  ;; CHECK:      (func $nested-blocks
  ;; CHECK-NEXT:  ;;@ src.cpp:2:1
  ;; CHECK-NEXT:  (block $label$1
  ;; CHECK-NEXT:   ;;@ src.cpp:2:2
  ;; CHECK-NEXT:   (block $label$2
  ;; CHECK-NEXT:    (br $label$2)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  ;;@ src.cpp:3:1
  ;; CHECK-NEXT:  (return)
  ;; CHECK-NEXT: )
  (func $nested-blocks
    ;;@ src.cpp:2:1
    (block $label$1
      ;;@ src.cpp:2:2
      (block $label$2
        (br $label$2)
      )
    )
    ;;@ src.cpp:3:1
    (return)
  )

  ;; CHECK:      (func $paths
  ;; CHECK-NEXT:  ;;@ /tmp/src.cpp:1:1
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  ;;@ ../src.cpp:2:2
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  ;;@ café.cpp:2:2
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  ;;@ café.cpp:2:2
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT: )
  (func $paths
    ;;@ /tmp/src.cpp:1:1
    (nop)
    ;;@ ../src.cpp:2:2
    (nop)
    ;;@ café.cpp:2:2
    (nop)
    ;; This annotation is invalid (missing column)
    ;;@ src.cpp:3
    (nop)
  )
)