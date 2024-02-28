let rec reverse n = let rec buff n = if n<10 then 1 else 10 * buff(n/10)
                    in if n<10 then n
                    else (n mod 10)*buff(n)+reverse(n/10);;

let palindromo s =  let rec aux x y = if x >= y then true
                    else if s.[x] = s.[y]  then aux (x+1) (y-1) else false in
                    if String.length s < 2 then true
                    else aux 0 (String.length s-1);;

let rec mcd (x,y) = 
        if x >= 0 && y >= 0 && (x <> 0 || y <> 0) then 
            if y = 0 then 
                x 
            else 
                mcd (y, (x mod y)) 
        else 0;;
