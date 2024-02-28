let rec insert x = function
	[] -> [x]
	| h::t -> if x <= h then 
					x :: h :: t
			else h :: insert x t

let rec isort = function
	[] -> []
	| h::t -> insert h (isort t)

let f a = a * Random.int 1000000;;
let bigl = List.init 1000000 f;; 

let insert_t a l =
	let rec aux_insert l lins= 
	match l with
	[] -> List.rev (a::lins)
	| h::t -> if a <= h then
				List.rev_append lins (a::h::t)
			 else aux_insert t (h::lins)
	in aux_insert l [];;

let isort_t l =
	let rec aux_isort l lisort =
	match l with 
	[] -> lisort
	| h::t -> aux_isort t (insert_t h lisort)
	in aux_isort l [];; 

let rec rlist n =
	if n = 0 then 
		[]
	else 
		Random.int 1000 :: rlist (n - 1);;

let ascending_list n = List.init n (fun i -> i + 1);;

let lc1 = ascending_list 10000;;
let lc2 = ascending_list 20000;;
let ld1 = List.rev(lc1);;
let ld2 = List.rev(lc2);;
let lr1 = rlist 10000;;
let lr2 = rlist 20000;;

let crono f x =
	let t = Sys.time () in
	let _ = f x in
	Sys.time () -. t;;

crono isort lr1;; (*: float = 0.908265000000028522*)
crono isort_t lr1;; (*: float = 1.37460200000003852*)

crono isort lr2;; (*: float = 4.0449169999999981*)
crono isort_t lr2;; (*: float = 6.20870000000002165*)
(*Como se puede observar la diferencia es notable, isort_t es más lento ya que se hace uso de 
 List.rev y List.rev_append, las cuales consumen bastante tiempo*)

let insert_g f a l =
	let rec aux_insert l lins= 
	match l with
	[] -> List.rev (a::lins)
	| h::t -> if f a h then
				List.rev_append lins (a::h::t)
			 else aux_insert t (h::lins)
	in aux_insert l [];;

let isort_g f l =
	let rec aux_isort l lisort =
	match l with 
	[] -> lisort
	| h::t -> aux_isort t (insert_g f h lisort)
	in aux_isort l [];;  

let rec split l = match l with
	h1::h2::t -> let t1, t2 = split t
				in h1::t1, h2::t2
	| _ -> l, [];;

let rec merge (l1,l2) = match l1, l2 with
	[], l | l, [] -> l
	| h1::t1, h2::t2 -> if h1 <= h2 then 
							h1 :: merge (t1, l2)
						else 
							h2 :: merge (l1, t2);;

let rec msort l = match l with
	[] | [_] -> l
	| _ -> let l1, l2 = split l
			in merge (msort l1, msort l2);;

let bigl2 = List.init 1000000 (function a -> a * Random.int 1000000);;

let split_t l=
	let rec aux_split l laux1 laux2 =
		match l with
		[] -> (List.rev laux1, List.rev laux2)
		| h::[] -> (List.rev (h::laux1), List.rev laux2)
		| h1::h2::t -> aux_split t (h1::laux1) (h2::laux2)
	in aux_split l [] [];;

let merge_t (l1, l2)= 
	let rec aux_merge (l1, l2) laux =
		match (l1, l2) with
		[], l | l, [] -> List.rev_append laux l
		| h1::t1, h2::t2 -> if h1 <= h2 then 
								aux_merge (t1, l2) (h1::laux)
							else 
								aux_merge (l1, t2) (h2::laux)
	in aux_merge (l1, l2) [];;

let rec msort' l = match l with
	[] | [_] -> l
	| _ -> let l1, l2 = split_t l
			in merge_t (msort' l1, msort' l2);;

let bigl3 = []
(*No hay forma que salte stack overflow ya que con split y merge creadas de forma recursiva terminal
 en msort' la lista se va haciendo cada vez mas pequeña hasta que llega hasta los casos base,
 que simplemente devolveran la lista en el caso de que solo tenga un elemento o esté vacia*)

(*Tiempos obtenidos:
 crono msort' lc1: float = 0.0264000000000000068
 crono msort' lc2: float = 0.053852000000000011
 crono msort' ld1: float = 0.0244669999999999888
 crono msort' ld2: float = 0.049925
 crono msort' lr1: float = 0.0213259999999999561
 crono msort' lr2: float = 0.0498679999999999679
 como podemos observar los tiempos son practicamente iguales, esto es asi ya que da igual 
 si ya esta ordenada o no, msort' siempre intercambiara todos los elementos y hará las mismas 
 operaciones, por eso no es un algoritmo muy util si la lista ya esta practicamente ordenada

 Si lo comparamos con msort normal:
 crono msort lr1: float = 0.0169580000000000286
 crono msort' lr1: float = 0.0216290000000000093
 crono msort lr2: float = 0.0358269999999999422
 crono msort' lr2: float = 0.0486210000000000253
 Se puede observar que los tiempos en msort son mas pequeños, por lo que se puede concluir que 
 si estamos trabajando con vectores de tamaño no excesivamente grande, este algoritmo será más 
 eficiente, y msort' será mejor en el caso de numeros extremadamente grandes (ya que no producirá
 stack overflow)
 *)

let merge_g f (l1, l2)= 
	let rec aux_merge (l1, l2) laux =
		match (l1, l2) with
		[], l | l, [] -> List.rev_append laux l
		| h1::t1, h2::t2 -> if f h1 h2 then 
								aux_merge (t1, l2) (h1::laux)
							else 
								aux_merge (l1, t2) (h2::laux)
	in aux_merge (l1, l2) [];;

let rec msort_g f l = match l with
	[] | [_] -> l
	| _ -> let l1, l2 = split_t l
			in merge_g f (msort' l1, msort' l2);;