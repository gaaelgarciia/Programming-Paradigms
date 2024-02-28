 let hd l=
 	match l with
 	| [] -> raise(Failure "hd")
 	| h::t -> h;;

 let tl l=
 	match l with 
 	| [] -> raise(Failure "tl")
 	| h::t -> t;;

 let rec length l=
 	match l with
 	| [] -> 0
 	| h::t -> 1 + length t;;

 let rec compare_lengths l1 l2 =
 	match l1,l2 with 
 	| ([], []) -> 0
 	| (_, []) -> 1
 	| ([], _) -> -1
 	| (h1::t1, h2::t2) -> compare_lengths t1 t2;;


 let rec compare_length_with l len =
 	match (l, len) with 
 	| ([] , 0) -> 0 
 	| (_ , 0) -> 1
 	| ([] , _) -> -1
 	| (_::t, _) -> compare_length_with t (len - 1);;

 let init len f =
 	if len<0 then 
 		raise(Invalid_argument "init")
 	else
 		let rec aux l acc =
 			if acc < 0 then
 				l
 			else 
 				aux (f acc::l) (acc-1)
 		in aux [] len;;
 		 
let rec nth l n =
	if n < 0 then 
		raise(Invalid_argument "nth")
	else
		match (l, n) with
		| ([], _) -> raise(Failure "nth")
		| (h::t, 0) -> h 
		| (h::t, n) -> nth t (n-1);; 

 let rec append l1 l2 =
 	match l1 with 
 	| [] -> l2
 	| h::t -> h::append t l2;;

 let rev l = 
 	let rec aux l lrev = 
 		match l with 
 		[] -> lrev
 		| h::t -> aux t (h::lrev)
 	in aux l [];;

 let rec rev_append l1 l2 =
 	match l1 with
 	[] -> l2
 	| h::t -> rev_append t (h::l2);;

 let rec concat l =
 	match l with
 	[] -> []
 	|h::t -> append h (concat t);;

 let rec flatten l =
 	match l with
 	[] -> []
 	|h::t -> append h (flatten t);;

 let rec split l =
 	match l with 
 	[] -> ([], [])
 	|(h1, h2) :: t -> let (t1, t2) = split t in (h1::t1), (h2::t2);;

 let rec combine l1 l2 =
	 match (l1,l2) with 
	 ([],[]) -> []
	 |([],_) -> raise(Invalid_argument "combine")
	 |(_,[]) -> raise(Invalid_argument "combine")
	 |(h1::t1 , h2::t2) -> (h1, h2) :: (combine t1 t2);;

 let rec map f l =
 	match l with 
 	[] -> []
 	| h::t -> f h::map f t;;

 let rec map2 f l1 l2 =
 	match (l1, l2) with 
 	([],[]) -> []
 	|([],_) -> raise(Invalid_argument "map2")
	 |(_,[]) -> raise(Invalid_argument "map2")
 	| (h1::t1 , h2::t2) -> f h1 h2 :: map2 f t1 t2;;


 let rev_map f l =
 	let rec rev_aux l lmap =
 		match l with 
 		[] -> lmap
 		|h :: t -> rev_aux t (f h :: lmap)
 	in rev_aux l [];; 

 let rec for_all f l =
 	match l with 
 	[] -> true;
 	|h :: t -> if f h = true then 
 					for_all f t 
 				else
 					false;;

let rec exists f l =
	match l with 
 	[] -> false;
 	|h :: t -> if f h = true then 
 					true 
 				else
 					exists f t;;

 let rec mem a set =
 	match set with
 	[] -> false
 	|h :: t -> if a <> h then 
 					mem a t
 				else 
 					true;;	

 let rec find f l =
 	match l with 
 	[] -> raise(Not_found);
 	|h :: t -> if f h = true then 
 					h
 				else
 					find f t;;

 let filter f l =
 	let rec filter_aux l lfilter =
 		match l with 
 		[] -> rev(lfilter)
 		|h :: t -> if f h = true then
 						filter_aux t (h::lfilter)
 					else 
 						filter_aux t lfilter
 	in filter_aux l [];;

 let find_all f l =
 	let rec find_aux l lfind =
 		match l with 
 		[] -> rev(lfind)
 		|h :: t -> if f h = true then
 						find_aux t (h::lfind)
 					else 
 						find_aux t lfind
 	in find_aux l [];;

 let partition f l =
 	let rec partition_aux l l1 l2 =
 		match l with 
 		[] -> (rev(l1), rev(l2))
 		|h :: t -> if f h = true then 
 						partition_aux t (h :: l1) l2
 					else 
 						partition_aux t l1 (h :: l2)
 	in partition_aux l [] [];;

 let rec fold_left f init l =
 	match l with 
 	[] -> init
 	|h :: t -> fold_left f (f init h) t;;

 let rec fold_right f l init =
 	match l with 
 	[] -> init 
 	|h :: t -> f h (fold_right f t init);;

 let rec assoc a l =
 	match l with 
 	[] -> raise(Not_found)
 	|(h1,h2) :: t -> if h1 = a then
 						h2
 					else 
 						assoc a t;;  


 let rec mem_assoc a l =
 	match l with 
 	[] -> false
 	|(h1,h2) :: t -> if h1 = a then
 						true
 					else 
 						mem_assoc a t;;

 let rec remove_assoc a l =
 	match l with 
 		[] -> []
 		|(h1,h2) :: t -> if h1 = a then 
 							t
 						else 
 						    (h1,h2) :: remove_assoc a t;;