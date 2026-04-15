type avltree =
  | Empty
  | Node of int * int * avltree * avltree

let t1 = Node (1, 1, Empty, Empty)
let t4 = Node (4, 1, Empty, Empty)
let t8 = Node (8, 1, Empty, Empty)
let t3 = Node (3, 2, t1, t4)
let t5 = Node (5, 3, t3, t8)

let t =
  Node (5, 3, 
    Node (3, 2,
      Node (1, 1, Empty, Empty), 
      Node (4, 1, Empty, Empty)),
    Node (8, 1, Empty, Empty))

let height t = 
  match t with
    | Empty -> 0
    | Node (_v, h, _l, _r) -> h

let leaf v = Node (v, 1, Empty, Empty)
let node (v, l, r) = Node (v, 1 + max (height l) (height r), l, r)
let t' =
  node (5,
    node (3,
      leaf 1,
      leaf 4),
    leaf 8)
  
let rec toList t =
  match t with
    | Empty -> []
    | Node (v, _h, l, r) -> 
      (* toList l @ (v :: toList r) *)
      toList l @ [v] @ toList r

type order = Less | Equal | Greater

let cmp x y =
  match compare x y with
  | 0 -> Equal
  | r when r < 0 -> Less
  | _ -> Greater

let rec search x t =
  match t with
    | Empty -> false
    | Node (y, _h, l, r) ->
      match cmp x y with
        | Equal -> true
        | Less -> search x l 
        | Greater -> search x r 

let imbalance t =
  match t with
    | Empty -> 0
    | Node (_v, _h, l, r) ->
      height l - height r

let show t =
  let make_space = String.map (fun _ -> ' ') in 
  let rec string_of_lvl lvl = function 
    | Empty -> if lvl = 0 then "E" else " " 
    | Node (n, h, l, r) ->
        let sn = string_of_int n in
        let sl = string_of_lvl lvl l in
        let sr = string_of_lvl lvl r in
            if h = lvl
            then make_space sl ^ sn ^ make_space sr
            else sl ^ make_space sn ^ sr
    in
    let rec print_levels lvl =
        if lvl >= 0
        then (print_string (string_of_int lvl ^ ": " ^ string_of_lvl lvl t ^ "\n");
            print_levels (lvl-1))
        else ()
    in
    let height = function
        | Node (_, y, _, _) -> y
        | Empty -> 0
    in
    print_levels (height t) ; flush stdout


(* testi *)
(*
let tr = Empty;;
let _ = show tr;;

let tr = add 1 tr;;
let test1 = tr = Node (1, 1, Empty, Empty) ;;
let _ = show tr;;


let tr = add 2 tr;;
let test2 = tr = Node (1, 2, Empty, Node (2, 1, Empty, Empty))
let _ = show tr;;

let tr = add 3 tr;;
let test3 = tr = Node (2, 2, Node (1, 1, Empty, Empty), Node (3, 1, Empty, Empty))
let _ = show tr;;

let tr = add 4 tr;;
let test4 = tr = Node (2, 3, Node (1, 1, Empty, Empty),
   Node (3, 2, Empty, Node (4, 1, Empty, Empty)))
let _ = show tr;;

let tr = add 5 tr;;
let test5 = tr = Node (2, 3, Node (1, 1, Empty, Empty),
   Node (4, 2, Node (3, 1, Empty, Empty), Node (5, 1, Empty, Empty)))
let _ = show tr;;

let tr = add 6 tr;;
let test6 = tr =  Node (4, 3,
   Node (2, 2, Node (1, 1, Empty, Empty), Node (3, 1, Empty, Empty)),
   Node (5, 2, Empty, Node (6, 1, Empty, Empty)))
let _ = show tr;;

let tr = add 7 tr;;
let test7 = tr = Node (4, 3,
   Node (2, 2, Node (1, 1, Empty, Empty), Node (3, 1, Empty, Empty)),
   Node (6, 2, Node (5, 1, Empty, Empty), Node (7, 1, Empty, Empty)))
let _ = show tr;;


let tr = remove 1 tr;;
let test_remove1 = tr = Node (4, 3, Node (2, 2, Empty, Node (3, 1, Empty, Empty)),
   Node (6, 2, Node (5, 1, Empty, Empty), Node (7, 1, Empty, Empty)))
let _ = show tr;;

let tr = remove 2 tr;;
let test_remove1 = tr = Node (4, 3, Node (3, 1, Empty, Empty),
   Node (6, 2, Node (5, 1, Empty, Empty), Node (7, 1, Empty, Empty)))
let _ = show tr;;

let tr = remove 3 tr;;
let test_remove1 = tr = Node (6, 3, Node (4, 2, Empty, Node (5, 1, Empty, Empty)),
   Node (7, 1, Empty, Empty))
let _ = show tr;;

let tr = remove 4 tr;;
let test_remove1 = tr = Node (6, 2, Node (5, 1, Empty, Empty), Node (7, 1, Empty, Empty))
let _ = show tr;;

let tr = remove 5 tr;;
let test_remove1 = tr = Node (6, 2, Empty, Node (7, 1, Empty, Empty))
let _ = show tr;;

let tr = remove 6 tr;;
let test_remove1 = tr = Node (7, 1, Empty, Empty)
let _ = show tr;;

let tr = remove 7 tr;;
let test_remove1 = tr = Empty
let _ = show tr;; *)