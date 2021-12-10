(* Coursework template

   Akshay Arunkumar Garg , H00338776          <--- confirm who you are 
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

(* type aliases for integer sequences and integer matrices *)
type int_seq = int list
type int_matrix = int_seq list

(* useful for debugging *)
let string_of_row row =
  String.concat ""
    (List.map (fun x -> string_of_int x ^ " ") row)

(* useful for debugging *)
let rec string_of_matrix m =
  match m with
      | []            -> ""
      | [[]]          -> ""
      | (row :: rest) ->
         string_of_row row ^ "\n" ^
         string_of_matrix rest

(* test whether a list of lists of integers represents a matrix.  The
   length of each row should be equal.*)
let is_matrix x =
  failwith "not implemented yet"

(* Declaring the len function which returns the length of the list passed as the parameter.*)
let rec len : 'a list -> int =
  fun xs ->
  (* Matching the list *)
  match xs with
  (* If the list is empty then returning 0 *)
  [] -> 0
  (* Else taking out one element and adding 1 to the function call which we are doing with the rest of the list  *)
  | (y::rest) -> 1 + len rest;;

(* function matrixshape takes the matrix, and calculates the number of
   columns and rows *)
let matrix_shape x =
  (* Matching the nested list *)
  match x with
  (* If the list is empty then returning tuple with value 0,0 *)
  [] -> (0,0)
  (* And if the both lists are empty then returning 0,1 *)
  | [[]] -> (0,1)
  (* Else taking out the first element as list and then calculating the length of the list using the len function declared above *)
  | (y::rest) -> (len y, len rest + 1);;


(* Declaring the recursive Function to add two lists and return the list *)
let rec row_add : int_seq -> int_seq -> int_seq =
  fun xs ys ->
  (* Matching both the lists *)
    match xs,ys with 
    (* If first list is empty and second is not then returning the empty list *)
    | [],_ -> []
    (* If second list is empty and first is not then also returning the empty list *)
    | _,[] -> []
    (* If both the lists are not empty then taking out the first value from both the lists and adding*)
    (* Waiting for the result of the function call which we are doing with rest of the list and then appending the calculated result*)
    | x :: xs,y :: ys -> (x+y) :: row_add xs ys;;

(* matrix addition *)
let rec matrix_add x y =
  (* Matching the list  *)
  match x , y with
  (* If both lists are empty then retuning the empty list *)
  [],[] ->[]
  (* If both the lists are not empty but the nested list is empty then returning the same *)
  |[[]],[[]] -> [[]]
  (* If first list is empty and second is not then returning the empty list *)
  |[],_ -> []
  (* If second list is empty and first is not then also returning the empty list *)
  |_,[] -> []
  (* If both the lists are not empty then taking out the first list from both the lists and then calling the row add function which will add both the lists and return the result and we are appending this result to the same function call of the other list *)
  | (xs::rest1) , (yx::rest2) -> row_add xs yx::matrix_add rest1 rest2;;

(* matrix multiplication *)
let matrix_mult x y =
  failwith "not implemented yet"
