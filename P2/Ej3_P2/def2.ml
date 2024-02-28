let pi = 2. *. asin 1.;;
let p= function x->if x > 0.0 then (2.0 *. pi *. x) else 0.0;;
let area = function x->if x > 0.0 then (pi *. x ** 2.0) else 0.0;;
let absf = function x->if x >= 0.0 then x else (-1.0 *. x);;
let even x = x mod 2 = 0;;
let next3 = function x-> if x mod 3 = 0 then x else x + (3 - (x mod 3));;
let is_a_letter = function c-> if c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' then true else false;;
let string_of_bool = function x-> if x = true then "Verdadero" else "Falso";;
