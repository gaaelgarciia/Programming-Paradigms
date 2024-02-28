let rec power x y = if y >= 0 then if y = 0 then 1 else x * (power x (y-1)) else 0;;

let rec power' x y = if y >= 0 then if y = 0 then 1 else if y mod 2 = 0 then (power (x * x) (y/2)) else x * (power (x * x) (y/2)) else 0;;

(*Sera mas eficiente ya que hace un menor numero de iteraciones, la ganancia obtenida si que merecera la pena, ya que si se eleva un numero grande se quitaran muchas iteraciones, mientras que con power se hara un numero 'y' de veces*)

let rec powerf x y = if y >= 0 then if y = 0 then 1. else if y mod 2 = 0 then (powerf (x *. x) (y/2)) else x *. (powerf (x *. x) (y/2)) else 0.;;
