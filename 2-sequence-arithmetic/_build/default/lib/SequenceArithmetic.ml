(* Coursework template

   My Name here, My UserID          <--- confirm who you are 
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

(* type declaration for intseq *)
type int_seq = int list

(* implementations *)

(* pointwise addition:

   seq_add [x1; ...; xn] [y1; ...; yn] = [x1 + y1; ...; xn + yn]
 *)
let rec seq_add : int_seq -> int_seq -> int_seq =
  fun xs ys ->
  (* Matching both the lists *)
    match xs,ys with 
    (* If first list is empty and second is not then returning the empty list *)
    | [],_ -> []
    (* If second list is empty and first is not then also returning the empty list *)
    | _,[] -> []
    (* If both the lists are not empty then taking out the first value from both the lists and calculating the sum*)
    (* Waiting for the result of the function call which we are doing with rest of the list*)
    | x :: xs,y :: ys -> (x+y) :: seq_add xs ys;;
(* pointwise multiplication:
  seq_mult [x1; ...; xn] [y1; ...; yn] = [x1 * y1; ...; xn * yn]
*)
let rec seq_mult : int_seq -> int_seq -> int_seq =
  fun xs ys ->
  (* Matching both the lists *)
    match xs,ys with 
    (* If first list is empty and second is not then returning the empty list *)
    | [],_ -> []
    (* If second list is empty and first is not then also returning the empty list *)
    | _,[] -> []
     (* If both the lists are not empty then taking out the first value from both the lists and multiplying*)
    (* Waiting for the result of the function call which we are doing with rest of the list and then appending the calculated result*)
    | x :: xs,y :: ys -> (x*y) :: (seq_mult xs ys);;
