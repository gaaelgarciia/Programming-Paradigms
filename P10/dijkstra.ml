(*Prioridades mutables*)

type ('a, 'b) queue = {mutable queue : ('a, 'b) node option}
and  ('a, 'b) node = {mutable prio: 'a; mutable ele: 'b; 
                      mutable left: ('a, 'b) queue; 
                      mutable right: ('a, 'b) queue}
                     
exception EmptyQueue                     

let new_queue () = {queue = None}     

let rec insert ({queue = q0} as q) p e = 
    match q0 with
      None -> q.queue <- Some {prio = p; ele = e; left = {queue = None}; right = {queue = None}}
    | Some ({prio = p0; ele = e0; left = l0; right = r0} as n) ->
        if p <= p0
        then begin n.prio <- p; n.ele <- e; n.left <- r0; n.right <- l0;
                   insert r0 p0 e0                  
             end
        else begin n.left <- r0; n.right <- l0;
                   insert r0 p e
             end  
              
let rec remove_top ({queue = q0} as q) = match q0 with
      None -> ()
    | Some ({left = {queue = None}; right = {queue = None}; _}) -> 
            q.queue <- None 
    | Some ({left = {queue = l0}; right = {queue = None}; _}) -> 
            q.queue <- l0
    | Some ({left = {queue = None}; right = {queue = r0}; _}) -> 
            q.queue <- r0
    | Some ({left = {queue = Some l_node}; right = {queue = Some r_node}; _} as n0) -> 
            if l_node.prio <= r_node.prio 
            then begin
              n0.prio <- l_node.prio; n0.ele <- l_node.ele;
              remove_top n0.left
            end
            else begin
              n0.prio <- r_node.prio; n0.ele <- r_node.ele;
              remove_top n0.right
            end

let extract ({queue = q0} as q) = match q0 with
    None -> raise EmptyQueue
  | Some {prio = p; ele = e; _} -> remove_top q; (p,e)


let extract_opt ({queue = q0} as q) = match q0 with
    None -> None 
  | Some {prio = p; ele = e; _} -> remove_top q; Some (p,e)
 
(*Dijkstra*)

let is_square m =
    let rows = Array.length m in 
    if rows = 0 then 
        false 
    else
        let cols = Array.length m.(0) in 
        if rows <> cols then 
            false 
        else  
            let rec aux_is_square buff =
                if buff = rows then 
                    true
                else
                    if Array.length m.(buff) <> cols then
                        false
                    else 
                        aux_is_square (buff + 1)
            in aux_is_square 0;; 

let is_positive m =
    let rows = Array.length m in 
    let rec aux_is_positive aux_rows aux_cols = 
        if aux_rows = rows then
            true
        else 
            if aux_cols = Array.length m.(aux_rows) then
                aux_is_positive (aux_rows + 1) 0
            else
                match m.(aux_rows).(aux_cols) with
                |Some x when x >= 0 -> aux_is_positive aux_rows (aux_cols + 1)
                |None -> aux_is_positive aux_rows (aux_cols + 1)
                | _ -> false
    in aux_is_positive 0 0;;


let dijkstra w =
  if is_square w && is_positive w then
    let n = Array.length w in
    let weights = Array.make_matrix n n None in
    let visited = Array.make n false in

    let rec aux_find_min_w queue =
      match extract_opt queue with
      | None -> (-1, Int.max_int)
      | Some (w, u) ->
        if not visited.(u) then (u, w)
        else aux_find_min_w queue

    in

    let process_node i queue weights visited =
        insert queue 0 i;
        weights.(i).(i) <- Some 0;

        while not (queue.queue = None) do 
            let (u, min_w) = aux_find_min_w queue in
            if u = -1 then 
                () 
            else begin
              visited.(u) <- true;
              for v = 0 to n - 1 do
                match w.(u).(v) with
                | Some weight when not visited.(v) ->
                  let new_w = min_w + weight in
                    (match weights.(i).(v) with
                       | None -> weights.(i).(v) <- Some new_w
                       | Some current_w when new_w < current_w -> weights.(i).(v) <- Some new_w
                       | _ -> ()
                    );
                  insert queue new_w v
                | _ -> ()
              done
            end
          done;
        Array.fill visited 0 n false
    in

    for i = 0 to n - 1 do 
        let queue = new_queue () in 
        process_node i queue weights visited
    done;
    
    weights

  else
    raise (Invalid_argument "dijkstra");;
   

