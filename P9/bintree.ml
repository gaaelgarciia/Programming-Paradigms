type 'a bintree = Empty | Node of 'a * 'a bintree * 'a bintree;;
let rec in_order = function
	| Empty -> []
	| Node (r, i, d) -> in_order i @ [r] @ in_order d;;
	
let rec insert ord tree x = match tree with
	| Empty -> Node (x, Empty, Empty)
	| Node (r, i, d) -> if ord x r then 
							Node (r, insert ord i x, d)
						else 
							Node (r, i, insert ord d x);;

let bst ord l =
	let tree = insert ord Empty (List.hd l) in
	let rec aux l_aux tree = match l_aux with
							[] -> tree 
							|h :: t -> aux t (insert ord tree h)	
	in aux (List.tl l) tree;;

let qsort ord l =
	in_order (bst ord l);;