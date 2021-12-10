(* Coursework template

   Akshay Arunkumar Garg, H00338776         <--- confirm who you are 
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

(* Write an essay on the OCaml type system. Be clear, to-the-point, and
   concise. Convince your marker that you understand:

   - Function type signatures.
   - Polymorphism.
   - List types and tuple types (and their differences).
   - OCaml pattern-matching on values (e.g. integers) and structures (e.g. lists).
   - Named and anonymous functions.
   - Recursive functions.
   - Unit and property based tests.

   Include short code-fragments (as in the lectures) to illustrate
   your observations.
   Do this in a literate programming style to include executable code
   to demonstrate the concepts you're writing about, e.g. *)

(* ======================================================================================================== *)
(* 1. Function type signatures.
   In Ocaml we can define function signatures in many ways. 
   -  In first way, we are going to pass the name of the parameter with its data type by adding ":" between the both. We can pass as many parameters as we want but at last we have to define the returning type of the function. 
   For Example : *)
(* Creating function with two parameters. Here s and front are the two parameters in this function. *)
let printString1 (front: string)(s:string) : string = 
    (* Concatinating the strings and returning the result *)
    front ^ s;;
(* Here, we can see we have passed two parameters with its data type and at last we are writing the return type of the function which is string here. *)

(*  - In second way, first we write the name of the function and then we are writing the data type of all the parameters and of the result with an arrow operator in between *)
let printString2 : string -> string -> string = 
    (* After this we will write fun for function and name of the parameters with space between them *)
    fun front s ->
    (* And then we are writing the content which should be there inside the function *)
    front ^ s;;

(* - In the third type of declaring functions, we dont define the data type of parameters but only the name of the variables.*)
(* This is only available for boolean operators in which any two values can be compared. *)
let checkBool2 (b1) (b2) =
    (* Comparing the two values and returning the result *)
    b1=b2;;
   
(* ======================================================================================================== *)

(* 2. Polymorphism
   Polymorphism means doing the same thing many times but in different ways. So, in ocaml same functions can be use in different ways. For example, the inbuilt add function which can be used to add floating numbers as well as float numbers. SO here we are using the same operator many times in different ways. 
   Example : 
 *)
(* -------- For Integer Numbers ----------- *)
(* Taking number in first variable *)
let firstNum : int = 20;;
(* Taking number in second variable *)
let secNum : int = 7;;
(* Adding both the numbers and storing it in third variable *)
let thirdNum : int = firstNum + secNum;;


(* -------- For Float Numbers ----------- *)
(* Taking number in first variable *)
let firNum : float = 20.5;;
(* Taking number in second variable *)
let secNum : float = 7.5;;
(* Adding both the numbers and storing it in third variable *)
let thirNum : float = firNum +. secNum;;

(* Also, there is a alpha type in which we dont have to define the type of the parameter. It automatically defines the type and uses it in the way in which it is coming.  *)
(* In this we are passing two values in parameters which are of type alpha and the returning type is the bool value. *)
let apply : 'a -> 'b -> bool = 
   (* Here, we are naming the parameters and then comparing them so that they can return the bool value. We can compare values of any data type. *)
   fun a b ->
      a = b

(* ======================================================================================================== *)
(* 3.List types and tuple types (and their differences). *)
(*  - List Types
   Lists are like arrays where we can store data of same data type. So, if we want to store multiple numbers we can store that in one list so that we dont have to declare multiple variables. Square brackets "[]" are used do store elements in the list. And here each element is seperated by ";" and we can add how many elements we want to.
   For Example :  *)
(* Here, we are declaring list of type integers which will store integer values. *)
let list1: int list = [1;2;3;4;5];;
(* Delaring empty list of type alpha which means we can store value of any type in the list *)
let empty = [];;
(* If we print the list we will see 'a list = [] which means this list can store values of any type *)

(*  - Tuple types 
   The disadvantage in lists are that we can store only one type of data like if we want to store the data of numbers and words together we cannot do that in lists. So, there is one more type called tuples which allows us to do this. This can be very helpful if we want to store data of multiple types. Round brackets "()" are used to store data in the list. But, here we have to define the data type of each element in the order in which we are storing the element. And each element is seperated by "," in the tuples.
*)
(* Example 1 :  *)
let tuple1 : int * string  = (10 , "Hello");;

(* Example 2 :  *)
let tuple2 : string * bool  = ("Akshay" , true);;

(* The difference between both is that, in list we have to store data of same type where as tuples allow us to store data of multiple types. Also, in lists we dont have to define the type of the data again and again which we have to do in tuples. *)
(* ======================================================================================================== *)

(*  4. OCaml pattern-matching on values (e.g. integers) and structures (e.g. lists). *)
(* Pattern matching in ocaml is similar to switch case in other languages. Here, we are matching the values with different values and if the values match then we perform the task related to it. 
Here, in the days function we are printing the name of the day according to number of day so we are matching the number of the days with the variable name day. And if the number is found then we are returning the string value associated with that number. *)
let days : int -> string =
    fun day ->
        match day with
        1 -> "Sunday"
        | 2 -> "Monday"
        | 3 -> "Tuesday"
        | 4 -> "Wednesday"
        | 5 -> "Thursday"
        | 6 -> "Friday"
        | 7 -> "Saturday"
        | _ -> "Nothing";;
(* For, structures like lists we can match whether the list is empty or not. Also, we can take out elements from the list and perform functions on that. *)
(* Declaring the function which accepts list of type alpha and then returns the bool value if the list is empty *)
let isEmpty ls : bool = 
    (* Here we are matching the list. *)
    match ls with 
    (* First we are checking if the list is empty then returning true *)
    [] -> true
    (* Else returning false *)
    | _ -> false;;
(* Declaring function which is accepting thd list of type alpha  and returning the length. *)
let rec lenOfList : 'a list -> int =
    fun ls -> 
    (* Matching the list *)
    match ls with 
    (* If the list is empty then returning 0 *)
    [] -> 0
    (* If it is not empty then we are removing one element then calling the same function with the rest of the list. Also we are adding 1 for the element we removed. *)
    | (x::rest) -> 1 + lenOfList rest;;

(* ======================================================================================================== *)
(*  5. Named and anonymous functions. 
   In many laguages, functions can be declared with name or without name. Functions without name are called anonymous functions and they are invoked imidiately when they are declared. They are written declaritive way. *)
(* Example Of Anonymous Function *)
(* Here, we are declaring function anonymously and passing 4 as a parameter in that function. *)
let double2 = (fun x->x*2) 4;;

(* Example Of Function declared with name *)
(* For functions with parameters we have to pass the argument and its type with it. So, here s is the name of the parameter and srting is the data type for s. After that we will pass the return type of the funtion after typing colon. *)
let printString (s:string) : string = 
    "Hello " ^ s;;
(* ======================================================================================================== *)
(* 6. Recursive Functions
   Recursive means calling the same thing again and again. So, in Ocaml we can use recursion in functions by calling the same function again and again. By this, we can perform multiple tasks which we use to do using loops ot iteration. 
   For Example : In the funtion sum, we are passing one argument sum and we are calling this function again and again to calculate the sum of the digits of the number. 
   So, if 149 is passed then result of the sum function will be 1 + 4 + 9 = 14.
 *)
 (* Declaring the function which accepts the parameter if type integer. *)
let rec sum num = 
   (* Matching the num variable with different values *)
   match num with
   (* If the value is 0 then returning 0 *)
   0 -> 0
   (* if it is not 0 then we are first calculting the modulus of the number and then waiting for the result of the function call which we have made for the other digits. *)
   | _ -> (num mod 10) + sum (num/10);;
(* ======================================================================================================== *)
(* 7. Unit and property based tests
      Tests are performed to check if the function or specific code which you have written works fine or not. There are many ways to test funcion in which two types
      1. Unit testing in which we pass the values in the function and cheks with the result if it is same or not. 
      For Example : 
      let complex_add_test1 _test_ctxt =
         assert_equal (1, 1) (complex_add (1, 0) (0, 1))
      Here, assert equals is used to check the values after function is executed. 
      
      2. Property based testing is for testing multiple properties like comutative property by testing functions. This helps us know whether the code works for properties or not.
*)

(* The following function adds two numbers together. It has types ... *)

let add (x:int) (y:int) : int = x + y

(* The following function... *)
