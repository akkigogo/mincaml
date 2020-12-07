let rec f x =
  let l = create_array x (0., 0.) in
  let rec g y =
    if (y = 0) then () else 
    (
      l.(y) <- (float_of_int y, float_of_int y);
      g (y - 1);
    )
  in g (x - 1);
  let rec z y =
    if (y = 0) then () else
    (
    let (a, b) = l.(y) in
      print_int (int_of_float (sqrt a)); 
      print_char 10;
      z (y - 1);
    )
  in z (x - 1)
in f 100