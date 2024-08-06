;; NOTE: Assertions have been generated by update_lit_checks.py --all-items and should not be edited.
;; RUN: foreach %s %t wasm-opt --enable-reference-types --enable-gc --merge-similar-functions -S -o - | filecheck %s

(module
  ;; CHECK:      (type $0 (func (result i32)))

  ;; CHECK:      (type $1 (func (param i32) (result i32)))

  ;; CHECK:      (func $big-const-42 (type $0) (result i32)
  ;; CHECK-NEXT:  (call $byn$mgfn-shared$big-const-42
  ;; CHECK-NEXT:   (i32.const 42)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $big-const-42 (result i32)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (i32.const 42)
  )

  ;; same as $big-const-42, but the set of $big-const-* derives {42, 42, 43} params
  ;; CHECK:      (func $big-const-42-1 (type $0) (result i32)
  ;; CHECK-NEXT:  (call $byn$mgfn-shared$big-const-42
  ;; CHECK-NEXT:   (i32.const 42)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $big-const-42-1 (result i32)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (i32.const 42)
  )
  ;; CHECK:      (func $big-const-43 (type $0) (result i32)
  ;; CHECK-NEXT:  (call $byn$mgfn-shared$big-const-42
  ;; CHECK-NEXT:   (i32.const 43)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $big-const-43 (result i32)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (i32.const 43)
  )

  ;; CHECK:      (func $small-const-44 (type $0) (result i32)
  ;; CHECK-NEXT:  (i32.const 44)
  ;; CHECK-NEXT: )
  (func $small-const-44 (result i32)
    (i32.const 44)
  )
  ;; CHECK:      (func $small-const-45 (type $0) (result i32)
  ;; CHECK-NEXT:  (i32.const 45)
  ;; CHECK-NEXT: )
  (func $small-const-45 (result i32)
    (i32.const 45)
  )
)

;; offset locals for extra params
;; CHECK:      (func $byn$mgfn-shared$big-const-42 (type $1) (param $0 i32) (result i32)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (local.get $0)
;; CHECK-NEXT: )
(module
  ;; CHECK:      (type $0 (func (param i32) (result i32)))

  ;; CHECK:      (type $1 (func (param i32 i32) (result i32)))

  ;; CHECK:      (func $take-param-and-local-0 (type $0) (param $0 i32) (result i32)
  ;; CHECK-NEXT:  (call $byn$mgfn-shared$take-param-and-local-0
  ;; CHECK-NEXT:   (local.get $0)
  ;; CHECK-NEXT:   (i32.const 42)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $take-param-and-local-0 (param $0 i32) (result i32)
    (local $1 i32)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (i32.add (i32.add (i32.const 42) (local.get $0)) (local.get $1))
  )
  ;; CHECK:      (func $take-param-and-local-1 (type $0) (param $0 i32) (result i32)
  ;; CHECK-NEXT:  (call $byn$mgfn-shared$take-param-and-local-0
  ;; CHECK-NEXT:   (local.get $0)
  ;; CHECK-NEXT:   (i32.const 43)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $take-param-and-local-1 (param $0 i32) (result i32)
    (local $1 i32)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (i32.add (i32.add (i32.const 43) (local.get $0)) (local.get $1))
  )

)

;; different callees
;; CHECK:      (func $byn$mgfn-shared$take-param-and-local-0 (type $1) (param $0 i32) (param $1 i32) (result i32)
;; CHECK-NEXT:  (local $2 i32)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (i32.add
;; CHECK-NEXT:   (i32.add
;; CHECK-NEXT:    (local.get $1)
;; CHECK-NEXT:    (local.get $0)
;; CHECK-NEXT:   )
;; CHECK-NEXT:   (local.get $2)
;; CHECK-NEXT:  )
;; CHECK-NEXT: )
(module
  ;; CHECK:      (type $0 (func (result i32)))

  ;; CHECK:      (type $1 (func (param i32) (result i32)))

  ;; CHECK:      (type $2 (func (param (ref $0)) (result i32)))

  ;; CHECK:      (type $3 (func (param (ref $1) i32) (result i32)))

  ;; CHECK:      (elem declare func $callee-0 $callee-1 $callee-2 $callee-take-arg-0 $callee-take-arg-1)

  ;; CHECK:      (func $callee-0 (type $0) (result i32)
  ;; CHECK-NEXT:  (i32.const 0)
  ;; CHECK-NEXT: )
  (func $callee-0 (result i32) (i32.const 0))
  ;; CHECK:      (func $callee-1 (type $0) (result i32)
  ;; CHECK-NEXT:  (i32.const 1)
  ;; CHECK-NEXT: )
  (func $callee-1 (result i32) (i32.const 1))
  ;; CHECK:      (func $callee-2 (type $0) (result i32)
  ;; CHECK-NEXT:  (i32.const 2)
  ;; CHECK-NEXT: )
  (func $callee-2 (result i32) (i32.const 2))

  ;; CHECK:      (func $callee-take-arg-0 (type $1) (param $0 i32) (result i32)
  ;; CHECK-NEXT:  (i32.const 0)
  ;; CHECK-NEXT: )
  (func $callee-take-arg-0 (param i32) (result i32) (i32.const 0))
  ;; CHECK:      (func $callee-take-arg-1 (type $1) (param $0 i32) (result i32)
  ;; CHECK-NEXT:  (i32.const 1)
  ;; CHECK-NEXT: )
  (func $callee-take-arg-1 (param i32) (result i32) (i32.const 1))
  ;; CHECK:      (func $callee-take-arg-2 (type $1) (param $0 i32) (result i32)
  ;; CHECK-NEXT:  (i32.const 2)
  ;; CHECK-NEXT: )
  (func $callee-take-arg-2 (param i32) (result i32) (i32.const 2))

  ;; CHECK:      (func $yes-call-callee-0 (type $0) (result i32)
  ;; CHECK-NEXT:  (call $byn$mgfn-shared$yes-call-callee-0
  ;; CHECK-NEXT:   (ref.func $callee-0)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $yes-call-callee-0 (result i32)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (call $callee-0)
  )
  ;; CHECK:      (func $yes-call-callee-1 (type $0) (result i32)
  ;; CHECK-NEXT:  (call $byn$mgfn-shared$yes-call-callee-0
  ;; CHECK-NEXT:   (ref.func $callee-1)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $yes-call-callee-1 (result i32)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (call $callee-1)
  )
  ;; CHECK:      (func $yes-call-callee-2 (type $0) (result i32)
  ;; CHECK-NEXT:  (call $byn$mgfn-shared$yes-call-callee-0
  ;; CHECK-NEXT:   (ref.func $callee-2)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $yes-call-callee-2 (result i32)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (call $callee-2)
  )


  ;; CHECK:      (func $yes-call-callee-take-arg-0 (type $0) (result i32)
  ;; CHECK-NEXT:  (call $byn$mgfn-shared$yes-call-callee-take-arg-0
  ;; CHECK-NEXT:   (ref.func $callee-take-arg-0)
  ;; CHECK-NEXT:   (i32.const 0)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $yes-call-callee-take-arg-0 (result i32)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (call $callee-take-arg-0 (i32.const 0))
  )
  ;; CHECK:      (func $yes-call-callee-take-arg-1 (type $0) (result i32)
  ;; CHECK-NEXT:  (call $byn$mgfn-shared$yes-call-callee-take-arg-0
  ;; CHECK-NEXT:   (ref.func $callee-take-arg-1)
  ;; CHECK-NEXT:   (i32.const 1)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $yes-call-callee-take-arg-1 (result i32)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (call $callee-take-arg-1 (i32.const 1))
  )


  ;; NOTE: calls with different argument expressions are not mergeable

  ;; CHECK:      (func $no-call-callee-take-arg-0 (type $0) (result i32)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (call $callee-take-arg-0
  ;; CHECK-NEXT:   (block (result i32)
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (i32.const 0)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (i32.const 0)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $no-call-callee-take-arg-0 (result i32)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (call $callee-take-arg-0
      (block (result i32)
        (drop (i32.const 0))
        (i32.const 0)
      )
    )
  )
  ;; CHECK:      (func $no-call-callee-take-arg-1 (type $0) (result i32)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT:  (call $callee-take-arg-1
  ;; CHECK-NEXT:   (block (result i32)
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (i32.const 0)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (i32.const 0)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (i32.const 0)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $no-call-callee-take-arg-1 (result i32)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (call $callee-take-arg-1
      (block (result i32)
        (drop (i32.const 0))
        (drop (i32.const 0))
        (i32.const 0)
      )
    )
  )

)

;; CHECK:      (func $byn$mgfn-shared$yes-call-callee-0 (type $2) (param $0 (ref $0)) (result i32)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (call_ref $0
;; CHECK-NEXT:   (local.get $0)
;; CHECK-NEXT:  )
;; CHECK-NEXT: )

;; CHECK:      (func $byn$mgfn-shared$yes-call-callee-take-arg-0 (type $3) (param $0 (ref $1)) (param $1 i32) (result i32)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (call_ref $1
;; CHECK-NEXT:   (local.get $1)
;; CHECK-NEXT:   (local.get $0)
;; CHECK-NEXT:  )
;; CHECK-NEXT: )
(module
  ;; CHECK:      (type $0 (func (result i32)))

  ;; CHECK:      (type $1 (func (param i32) (result i32)))

  ;; CHECK:      (func $use-42-twice (type $0) (result i32)
  ;; CHECK-NEXT:  (call $byn$mgfn-shared$use-42-twice
  ;; CHECK-NEXT:   (i32.const 42)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $use-42-twice (result i32)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (i32.add
      (i32.const 42)
      (i32.const 42)
    )
  )
  ;; CHECK:      (func $use-43-twice (type $0) (result i32)
  ;; CHECK-NEXT:  (call $byn$mgfn-shared$use-42-twice
  ;; CHECK-NEXT:   (i32.const 43)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $use-43-twice (result i32)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (nop) (nop) (nop) (nop) (nop) (nop)
    (i32.add
      (i32.const 43)
      (i32.const 43)
    )
  )

)

;; CHECK:      (func $byn$mgfn-shared$use-42-twice (type $1) (param $0 i32) (result i32)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (nop)
;; CHECK-NEXT:  (i32.add
;; CHECK-NEXT:   (local.get $0)
;; CHECK-NEXT:   (local.get $0)
;; CHECK-NEXT:  )
;; CHECK-NEXT: )
(module
  ;; CHECK:      (type $0 (func (param i32 i32)))

  ;; CHECK:      (type $1 (func (param i32 i32 i32)))

  ;; CHECK:      (func $yes-offset-local-indices-1 (type $0) (param $a i32) (param $b i32)
  ;; CHECK-NEXT:  (call $byn$mgfn-shared$yes-offset-local-indices-1
  ;; CHECK-NEXT:   (local.get $a)
  ;; CHECK-NEXT:   (local.get $b)
  ;; CHECK-NEXT:   (i32.const 1)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $yes-offset-local-indices-1 (param $a i32) (param $b i32)
    (local $x i32)
    (local $y i32)
    (drop (local.get $a))
    (drop (local.get $b))
    (drop (local.get $x))
    (drop (local.get $y))
    (drop (local.tee $x (local.get $x)))
    (drop (local.tee $y (local.get $y)))
    (drop (local.tee $a (local.get $a)))
    (drop (local.tee $b (local.get $b)))
    (drop (i32.const 1))
  )
  ;; CHECK:      (func $yes-offset-local-indices-2 (type $0) (param $a i32) (param $b i32)
  ;; CHECK-NEXT:  (call $byn$mgfn-shared$yes-offset-local-indices-1
  ;; CHECK-NEXT:   (local.get $a)
  ;; CHECK-NEXT:   (local.get $b)
  ;; CHECK-NEXT:   (i32.const 2)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $yes-offset-local-indices-2 (param $a i32) (param $b i32)
    (local $x i32)
    (local $y i32)
    (drop (local.get $a))
    (drop (local.get $b))
    (drop (local.get $x))
    (drop (local.get $y))
    (drop (local.tee $x (local.get $x)))
    (drop (local.tee $y (local.get $y)))
    (drop (local.tee $a (local.get $a)))
    (drop (local.tee $b (local.get $b)))
    (drop (i32.const 2))
  )

)
;; CHECK:      (func $byn$mgfn-shared$yes-offset-local-indices-1 (type $1) (param $0 i32) (param $1 i32) (param $2 i32)
;; CHECK-NEXT:  (local $3 i32)
;; CHECK-NEXT:  (local $4 i32)
;; CHECK-NEXT:  (drop
;; CHECK-NEXT:   (local.get $0)
;; CHECK-NEXT:  )
;; CHECK-NEXT:  (drop
;; CHECK-NEXT:   (local.get $1)
;; CHECK-NEXT:  )
;; CHECK-NEXT:  (drop
;; CHECK-NEXT:   (local.get $3)
;; CHECK-NEXT:  )
;; CHECK-NEXT:  (drop
;; CHECK-NEXT:   (local.get $4)
;; CHECK-NEXT:  )
;; CHECK-NEXT:  (drop
;; CHECK-NEXT:   (local.tee $3
;; CHECK-NEXT:    (local.get $3)
;; CHECK-NEXT:   )
;; CHECK-NEXT:  )
;; CHECK-NEXT:  (drop
;; CHECK-NEXT:   (local.tee $4
;; CHECK-NEXT:    (local.get $4)
;; CHECK-NEXT:   )
;; CHECK-NEXT:  )
;; CHECK-NEXT:  (drop
;; CHECK-NEXT:   (local.tee $0
;; CHECK-NEXT:    (local.get $0)
;; CHECK-NEXT:   )
;; CHECK-NEXT:  )
;; CHECK-NEXT:  (drop
;; CHECK-NEXT:   (local.tee $1
;; CHECK-NEXT:    (local.get $1)
;; CHECK-NEXT:   )
;; CHECK-NEXT:  )
;; CHECK-NEXT:  (drop
;; CHECK-NEXT:   (local.get $2)
;; CHECK-NEXT:  )
;; CHECK-NEXT: )