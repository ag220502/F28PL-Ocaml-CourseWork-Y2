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

(* implement the function *)
(* In curry function, we are passing one function as an argument and that function accepts the parameter of type tuple and returns the alpha type. So in the curry function, second and the third parameter are the values which will be passed to the function call. *)
let curry : (('a * 'b) -> 'c) -> 'a -> 'b -> 'c =
  fun f x y ->
  (* Here, we are calling the function f and coverting values x and y to tuple because function f accepts tuple. *)
    f (x,y);;

(* implement the function *)
(* In uncurry function, first parameter is the function which we are passing and second parameter is the tuple which is accepted by the function passed in the parameter and returns the result of type alpha. *)
let uncurry : ('a -> 'b -> 'c) -> ('a * 'b) -> 'c =
  fun f p ->
  (* Here, we are calling the function. As we can see in the above declaration of function signature the passed function accepts two alpha values so we are breaking down the tuple in two values and passign those value as parameter. *)
    f (fst p) (snd p) ;;


