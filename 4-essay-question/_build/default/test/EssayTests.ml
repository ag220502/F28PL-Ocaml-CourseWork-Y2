(* Coursework template

   Akshay Arunkumar Garg, H00338776          <--- confirm who you are 
   F28PL Coursework 2, OCaml        <--- confirm what you're submitting

   You may assume variables and functions defined in earlier questions
   in your answers to later questions, though you should add comments
   in code explaining this if any clarification might help read your
   code.

   To do this coursework, FORK, THEN CLONE the gitlab project.

   If you do it the other way around, then you'll have cloned *my*
   project (which you can't `git push` to), rather than cloned *your
   fork* of the project (which you can `git push` to).

   Any questions, don't guess: ask.

   This coursework is live exam material so KEEP YOUR ANSWERS PRIVATE. *)
open Essay
open OUnit2

(* unit tests *)

let add_test1 _test_ctxt =
  assert_equal 9 (add 5 4)

let printString1_test _test_ctxt = 
  assert_equal "HelloWorld" (printString1 "Hello" "World")

let printString2_test _test_ctxt = 
  assert_equal "HelloWorld" (printString2 "Hello" "World")

let checkBool2_test _test_ctxt = 
  assert_equal true (checkBool2 3 3)

let apply_test _test_ctxt = 
  assert_equal true (apply "a" "a")

let days_test _test_ctxt = 
  assert_equal "Wednesday" (days 4)

let isEmpty_test _test_ctxt = 
  assert_equal false (isEmpty [1;2;3;4])

let lenOfList_test _test_ctxt = 
  assert_equal 4 (lenOfList [1;2;3;4])

let printString_test _test_ctxt = 
  assert_equal "Hello World" (printString "World")

let sum_test _test_ctxt = 
  assert_equal 14 (sum 149)

(* list of unit tests *)
let unit_tests =
  [ "add_test1" >::add_test1;
    "printString1_test" >::printString1_test;
    "printString2_test" >::printString2_test;
    "checkBool2_test" >::checkBool2_test;
    "apply_test" >::apply_test;
    "days_test" >::days_test;
    "isEmpty_test" >::isEmpty_test;
    "lenOfList_test" >::lenOfList_test;
    "printString_test" >::printString_test;
    "sum_test" >::sum_test
  ]

(* property based tests *)

let add_zero =
  QCheck.Test.make ~name:"seqmult_zeros" ~count:1000
    QCheck.(make Gen.nat)
    (fun x ->
      add x 0 = x
      && add 0 x = x)

(* list of all property tests *)
let property_tests =
  List.map QCheck_ounit.to_ounit2_test
    [ add_zero
    ]

(* run the unit and property based tests *)
let () =
  run_test_tt_main
    ("sequence_arithmetic_tests" >:::
       (List.append unit_tests property_tests))
