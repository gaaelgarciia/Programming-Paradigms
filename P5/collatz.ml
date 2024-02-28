let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1;;

let rec orbit n = 
	if n = 1 then 
		"1" 
	else 
		string_of_int (n) ^ "," ^ orbit(f n);;

let rec length n = 
	if n = 1 then 
		0 
	else 
		1 + length(f n);;

let rec top n = 
	if n = 1 then 
		0 
	else 
		max n (top(f n));;

let rec length'n'top n = 
	if n = 1 then 
		(0, 0) 
	else 
		let aux = length'n'top(f n) in (1 + fst aux, max n (snd aux));;

let rec longest_in m n = 
	if n = m then 
		(n, length n)
	else 
		if  (length  n > length m) then 
			longest_in (m+1) n 
		else 
			longest_in m (n-1);;

let rec highest_in m n = 
	if n = m then 
		(n, top n) 
	else 
		if (top n > top m) then 
			highest_in (m+1) n 
		else 
			highest_in m (n-1);;
