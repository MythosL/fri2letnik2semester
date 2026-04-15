type status = { version : string; code : int } ;;
let mystatus = { version = "HTTP/1.1"; code = 200 } ;;

let string_of_status s =
  s.version ^ " " ^
  string_of_int s.code ^ " " ^
  (match s.code with
   | 200 -> "OK"
   | 404 -> "Page not Found"
   | 301 -> "Moved Permanently"
   | _ -> "")

type barva = Red | Black

type field =
    | Server of string
    | ContentLength of int

type response = {status: status; headers: field list; body: string}

let string_of_field f =
    match f with
    | Server name -> "Server: " ^ name
    | ContentLength length -> "Content-Length: " ^ string_of_int length


let r = {
    status={version="HTTP/1.1"; code=200};
    headers=[Server "nginx/1.6.2"; ContentLength 13];
    body="hello world!\n"
}
let string_of_response r =
    string_of_status r.status
    ^ "\n" ^ 
    String.concat "\n" (List.map string_of_field r.headers)
    ^ "\n" ^ 
    r.body