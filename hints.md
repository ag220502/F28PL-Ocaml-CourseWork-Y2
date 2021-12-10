# OCaml Coursework hints

Q1.

  This one *should* be easy. If you're stuck then please post a
  comment on GitLab.

  This is also a good opportunity to get on top of testing - both unit
  tests and property tests.

  You should be able to do everything you need by following the
  examples in the existing tests. However, here's some additional
  information about unit testing in OCaml

  https://gildor478.github.io/ounit/ounit2/index.html

  and property testing in OCaml:

  http://c-cube.github.io/qcheck/0.5.1/QCheck.html

  The latter is quite complex and powerful, and you don't need to
  understand all of the details in order to do the coursework -
  e.g. in this question you just need to replace `false` in the
  property tests with the appropriate code.

Q2.

  As I taught you in the lectures, the first thing to try when writing
  functions that operate on lists is pattern matching. Here you may
  need to pattern match on two lists at once. See the source code for
  the `List` module and the sample answers for the OCaml exercises for
  plenty of examples of this kind.

  https://github.com/ocaml/ocaml/blob/trunk/stdlib/list.mli
  https://github.com/ocaml/ocaml/blob/trunk/stdlib/list.ml

  https://gitlab-student.macs.hw.ac.uk/f28pl-2021-22/lectures-and-courseworks/f28pl-2021-22-lecture-materials/-/tree/main/ocaml-exercises/lib

  The `List.map2` function (which is the same thing as
  `zip_lists_with` from the exercises) is a particularly useful
  example - you may even be able to use it directly rather than
  writing your own pattern matching code.

Q3.

  The functions in the `List` module may be helpful for tackling this
  question.

  https://caml.inria.fr/pub/docs/manual-ocaml/libref/List.html

  Feel free to use any of them.

  You may find `List.length` and `List.for_all` helpful for
  `is_matrix`.

  Implementing `matrix_shape` should be easy. I don't think I can give
  you any hints without effectively answering the question for you.

  The key challenges of this question are with `matrix_add` and (more
  so) `matrix_mult` - which is probably the hardest question. The main
  issue is that you cannot directly implement matrix addition and
  matrix multiplication as traditionally specified using indexes
  because you've been asked to represent matrices as *immutable* lists
  of lists.

  There are number of ways round this. A somewhat hacky approach,
  which does work, but which requires some effort, is to simulate
  mutating an element of the matrix at row i and column j by defining
  a function that copies the matrix and just updates that one
  element. There is a much cleaner approach that involves no indexing
  at all, and which a seasoned functional programmer would be happy
  with. I'll give you some hints about the cleaner way.

  ## The `matrix_add` function

  You may find `seq_add` from Q2 and `List.map2` (which is the same
  thing as `zip_lists_with` from the exercises) helpful.

  ## The `matrix_mult` function

  1) Implement helper functions for transposing a matrix and computing
  the dot product. Both can be defined using pattern matching and
  recursion - or if you're feeling brave using `List.fold_right`.

  2) Traditionally (e.g. on the mathisfun website) matrix
  multiplication is described by, for each element, computing the dot
  product of a row from the first matrix and a *column* from the
  second matrix. If, however, you transpose the second matrix, then
  each element of the result matrix can be computed as the dot product
  of a row from the first matrix and a *row* from the second matrix.

  3) You should be able to compute each result row by applying the dot
  product once for each row in the second matrix, e.g., by using
  `List.map`. You can repeat the same computation for each row of the
  first matrix in order to generate all rows of the result matrix,
  e.g., by using `List.map` again.

  If you get this right, then it is actually possible (after having
  defined transpose and dot product) to write both `matrix_add` and
  `matrix_mult` as one-liners.

Q4.

  As the question says, you should combine your essay (in comments)
  with snippets of code (not in comments).

  It's sensible to write tests to make sure that the code does what
  you expect.  For convenience and standardisation, we provide a
  `test/EssayTests.ml` file for any tests you may write.

  To get the marks you need to systematically cover *all* of the seven
  concepts. You don't need to write lots of text, but briefly explain
  each concept and illustrate it with a well-chosen example.

  Make sure that this question (just like all the others) compiles
  without errors, even if it is mostly comments! If your code doesn't
  compile then you will lose marks.

Q5.

  Use the function type signatures to guide you. Work out (the only
  way) you can combine the arguments together in order to get a value
  of the return type out.

Q6.

  The implementation of both functions is essentially given to you in
  the question in the PDF. The actual implementations are just more
  concise ways of saying what is written in the text. The `i2c`
  function requires recursion. The `c2i` function does not because the
  necessary function calls are already implicitly in the Church
  encoding (e.g. the Church encoding of `3` is represented as code
  that runs a function `3` times already). Your job is just to give it
  the correct function and base case.

  The first five church numerals are written like this.

    # let zero : church_numeral = fun f x -> x;;
    val zero : church_numeral = <fun>
    # let one : church_numeral = fun f x -> f x;;
    val one : church_numeral = <fun>
    # let two : church_numeral = fun f x -> f (f x);;
    val two : church_numeral = <fun>
    # let three : church_numeral = fun f x -> f (f (f x));;
    val three : church_numeral = <fun>
    # let four : church_numeral = fun f x -> f (f (f (f x)));;
    val four : church_numeral = <fun>

  The `i2c` function is just a way of recursively generating any one
  of these given an integer.

Q7.

  This is a more advanced question, but it does not require huge amounts
  of code. If you find yourself writing lots of code, then you're probably
  doing something wrong.
