;; NOTE: Assertions have been generated by update_lit_checks.py and should not be edited.
;; RUN: wasm-opt %s -S -o - | filecheck %s --check-prefix=NRML
;; RUN: env BINARYEN_PRINT_FULL=1 wasm-opt %s -S -o - | filecheck %s --check-prefix=FULL

;;
;; Compare normal text output with debug info to full mode.
;;
;; Full mode does not skip repeated debug info in some cases, see below. It also
;; annotates the type of each node.
;;

(module
  ;; NRML:      (func $a
  ;; NRML-NEXT:  ;;@ src.cpp:1:2
  ;; NRML-NEXT:  (block $block
  ;; NRML-NEXT:   (drop
  ;; NRML-NEXT:    (i32.const 0)
  ;; NRML-NEXT:   )
  ;; NRML-NEXT:   ;;@ src.cpp:3:4
  ;; NRML-NEXT:   (drop
  ;; NRML-NEXT:    (i32.const 1)
  ;; NRML-NEXT:   )
  ;; NRML-NEXT:   ;;@ src.cpp:3:4
  ;; NRML-NEXT:   (drop
  ;; NRML-NEXT:    (i32.const 2)
  ;; NRML-NEXT:   )
  ;; NRML-NEXT:  )
  ;; NRML-NEXT: )
  ;; FULL:      (func $a
  ;; FULL-NEXT:  ;;@ src.cpp:1:2
  ;; FULL-NEXT:  (block $block (; none ;)
  ;; FULL-NEXT:   ;;@ src.cpp:1:2
  ;; FULL-NEXT:   (drop
  ;; FULL-NEXT:    ;;@ src.cpp:1:2
  ;; FULL-NEXT:    (i32.const 0) (; i32 ;)
  ;; FULL-NEXT:   ) (; none ;)
  ;; FULL-NEXT:   ;;@ src.cpp:3:4
  ;; FULL-NEXT:   (drop
  ;; FULL-NEXT:    ;;@ src.cpp:3:4
  ;; FULL-NEXT:    (i32.const 1) (; i32 ;)
  ;; FULL-NEXT:   ) (; none ;)
  ;; FULL-NEXT:   ;;@ src.cpp:3:4
  ;; FULL-NEXT:   (drop
  ;; FULL-NEXT:    ;;@ src.cpp:3:4
  ;; FULL-NEXT:    (i32.const 2) (; i32 ;)
  ;; FULL-NEXT:   ) (; none ;)
  ;; FULL-NEXT:  ) ;; end block block (; none ;)
  ;; FULL-NEXT: )
  (func $a
    ;;@ src.cpp:1:2
    (block $block
      (drop (i32.const 0)) ;; this child has the same location as the parent
                           ;; block, and only in full mode will we print such
                           ;; repeating info, including on the const child of
                           ;; the drop
      ;;@ src.cpp:3:4
      (drop (i32.const 1))
      (drop (i32.const 2)) ;; this child has the same location as the sibling
                           ;; before it, but we print it in normal mode as well
                           ;; as full mode (as that seems less confusing). in
                           ;; full mode, however, we also annotate the location
                           ;; of the const node children of the drops.
    )
  )
)