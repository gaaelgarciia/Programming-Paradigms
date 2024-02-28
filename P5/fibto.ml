let rec fib n = 
	if n <= 1 then 
		n 
	else 
		fib(n - 1) + fib(n - 2);;

let max = int_of_string Sys.argv.(1);;

let () = 
		if(Array.length Sys.argv = 2) then 
			let rec aux n =
				if fib n <= max then begin
					print_endline(string_of_int(fib n));
					aux (n + 1);
				end
				else 
					()
			in aux 0
		else 
			print_endline "fibto: Invalid number of arguments";;
		

