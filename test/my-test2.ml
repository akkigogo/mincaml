let rec f x y z = 
  let rec g w = 
    x + y + z + w in
      g 4 in
      print_int(f 1 2 3)