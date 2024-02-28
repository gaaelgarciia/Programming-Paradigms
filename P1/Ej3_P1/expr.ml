();;
(*Mostrará "unit"*)
(*Error: Mostró unit = ()*)
2 + 5 * 3;;
(*Compilará el numero 17, pero no mostrará nada*)
(*Mostró int = 17*)
1.25 *. 2.0;;
(*Mostrará float = 2.5*)
(*2 - 2.0;;*)
(*"Error, no mostrará nada, int - float", lo corrijo poniendo 2.0 y -.*)
(*3.0 + 2.0;;*)
(*Error, haciendo suma de enteros con dos floats, lo corrijo poniendo +.*)
5 / 3;;
(*int = 1*)
5 mod 3;;
(*int = 2*)
2.0 *. 3.0 ** 2.0;;
(*float = 6.0 -> 2.0*)
(*Error, el ** es un elevado, por tanto el resultado es float = 18*)
2.0 ** 3.0 ** 2.0;;
(*float = 64*)
(*Error de calculo, float = 512*)
sqrt;;
(*float -> float = <fun>*)
(*sqrt 4;;*)
(*float = 2*)
(*Error, con 4 no funciona ya que es un entero, tendria que ser 4.*)
int_of_float;;
(*float -> int = <fun>*)
float_of_int;;
(*int -> float = <fun>*)
3.0 = float_of_int 3;;
(*float = 3.0*);;
(*Error, bool = true, no está asignando nada*)
(*int_of_float -2.9;;*)
(*Saldrá error, ya que cuando es negativo hay que usar paréntesis*)
int_of_float 2.1 + int_of_float (-2.9);;
(*int = 0*)
truncate;;
(*float -> int = <fun>*)
truncate 2.1 + truncate (-2.9);;
(*int = 0*)
floor;;
(*float -> float = <fun>, se utiliza para aproximar hacia abajo un float*)
floor 2.1 +. floor (-2.9);;
(*float = -1.*)
ceil;;
(*float -> float = <fun>, se utiliza para aproximar hacia arriba un float*)
ceil 2.1 +. ceil (-2.9);;
(*float = 1.*)
int_of_char;;
(*char -> int = <fun>*)
int_of_char 'A';;
(*int = 65, correspondiente a la A en la tabala ascii*)
char_of_int;;
(*int -> char = <fun>, es decir, convertira un entero en un carácter, usando ascii*)
char_of_int 66;;
(*char = 'B'*)
Char.code;;
(*char -> int = <fun>*)
Char.code 'B';;
(*int = 66*)
Char.chr;;
(*int -> char = <fun>*)
Char.chr 67;;
(*char = 'C'*)
'\067';;
(*char = 'C'*)
Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'M');;
(*char = 'm' ya que la suma es 97-65+77 = 109 lo cual es codigo ascii es m*)
Char.lowercase_ascii;;
(*char -> char = <fun>*)
Char.lowercase_ascii 'M';;
(*char = 'm'*)
Char.uppercase_ascii;;
(*char -> char = <fun>*)
Char.uppercase_ascii 'm';;
(*char = 'M'*)
"this is a string";;
(*string = "this is a string"*)
String.length;;
(*string -> int = <fun>*)
String.length "longitud";;
(*int = 8*)
(*"1999" + "1";;*)
(*no funciona ya que + es para enteros*)
"1999" ^ "1";;
(*string = "19911"*)
int_of_string;;
(*string -> int = <fun> convertira un string en un entero*)
int_of_string "1999" + 1;;
(*int = 2000*)
"\065\065";;
(*string = "AA"*)
string_of_int;;
(*int -> string = <fun> convierte un entero en un string, en decimal*)
string_of_int 010;;
(*string = "010"*)
(*Error, lo convierte a decimal; string = "10"*)
not true;;
(*bool = false*)
true && false;;
(*bool = false*)
true || false;;
(*bool = true*)
(1 < 2) = false;;
(*bool = false*)
"1" < "2";;
(*bool = true*)
2 < 12;;
(*bool = true*)
"2" < "12";;
(*bool = false ya que el segundo empieza por 1*)
"uno" < "dos";;
(*bool = false, ya que alfabeticamente no es correcto*)
if 3 = 4 then 0 else 4;;
(*int = 4 siempre ya que 3 = 4 siempre sera false*)
if 3 = 4 then "0" else "4";;
(*string = "4" ya que 3 = 4 es falso siempre*)
(*if 3 = 4 then 0 else "4";;*)
(*da error ya que el then y el else tiene que tener el mismo tipo de datos*)
(if 3 < 5 then 8 else 10) + 4;;
(*int = 12*)

