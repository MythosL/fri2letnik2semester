(* PODATKOVNI TIP STATUS IN STATUSNA SPOROČILA *)

type status = { (* produkt tipov *)
    version : string;
    code : int
}

let my_status = { version = "HTTP/1.1"; code = 418 }

let string_of_status s =
  s.version ^ " " ^
  string_of_int s.code ^ " " ^
  (
   match s.code with
   | 100 -> "Continue"
   | 200 -> "OK"
   | 301 -> "Moved Permanently"
   | 404 -> "Not Found"
   | 418 -> "I'm a teapot"
   | 503 -> "Service Unavailable"
       (* in še mnogo več ... *)
   | _ -> "" (* neznan status *)
  )

(* DATUMI *)

type date = {
    dayOfWeek : string;
    dayOfMonth : int;
    month : string;
    year : int;
    hour : int;
    minute : int;
    second : int;
    timeZone : string;
}

let string_of_date d =
  d.dayOfWeek ^ ", " ^
  string_of_int d.dayOfMonth ^ " " ^
  d.month ^ " " ^
  string_of_int d.year ^ " " ^
  string_of_int d.hour ^ " " ^
  string_of_int d.minute ^ " " ^
  string_of_int d.second ^ " " ^
  d.timeZone

(* URI *)

type host = (* vsota tipov *)
    | IPV4 of int * int * int * int
    | IPV6 of string * string * string * string * string * string * string * string
    | HostName of string list

let string_of_host h =
    match h with
    | IPV4 (a, b, c, d) ->
	string_of_int a ^ "." ^ string_of_int b ^ "." ^ string_of_int c ^ "." ^ string_of_int d
    | IPV6 (a, b, c, d, e, f, g, h) ->
	"[" ^ a ^ ":" ^ b ^ ":" ^ c ^ ":" ^ d ^ ":" ^ e ^ ":" ^ f ^ ":" ^ g ^ ":" ^ h ^ "]"
    | HostName hn -> String.concat "." hn

type uri = {
    scheme : string; (* to polje je obvezno ... *)
    user : string option; (* ... ostala polja pa ne, zato dodamo "option" *)
    password : string option;
    host : host option;
    port : int option;
    path : string list;
    query : (string * string) list; (* seznam ključev in vrednosti *)
    fragment : string option;
}

let string_of_path p = String.concat "/" p

let string_of_query1 (key, value) = key ^ "=" ^ value

let string_of_query q = String.concat "&" (List.map string_of_query1 q)

let string_of_uri u =
  u.scheme ^ ":" ^
  (
   match u.host with
   | None -> ""
   | Some host -> "//" ^ (
        match u.user with
        | None -> ""
        | Some user -> user ^ (
             match u.password with
             | None -> ""
             | Some pass -> ":" ^ pass
            ) ^ "@"
       ) ^ string_of_host host ^ (
        match u.port with
        | None -> ""
        | Some port -> string_of_int port
       )
  ) ^ (
    match u.path with
    | [] -> ""
    | path -> "/" ^ string_of_path path
  ) ^ (
    match u.query with
    | [] -> ""
    | query -> "?" ^ string_of_query query
  ) ^ (
    match u.fragment with
    | None -> ""
    | Some fragment -> "#" ^ fragment
  )

(* PODATKOVNI TIP RESPONSE *)

(* POLJA GLAVE *)

(* expires *)

type expires =
  | Date of date (* POZOR: ta "Date" ne sme biti poimenovan isto kot v tipu "field" *)
  | Number of int

let string_of_expires e =
  match e with
  | Date d -> string_of_date d
  | Number n -> string_of_int n

(* transfer encoding *)

type transferEncoding = Chunked | Compress | Deflate | Gzip | Identity

let string_of_transferEncoding te =
    match te with
    | Chunked -> "chunked"
    | Compress -> "compress"
    | Deflate -> "deflate"
    | Gzip -> "gzip"
    | Identity -> "identity"

(* polja glave *)

type field =
  | Server of string
  | ContentLength of int
  | ContentType of string
  | Location of uri
  | Date of date
  | Expires of expires
  | LastModified of date
  | TransferEncoding of transferEncoding

let string_of_field f =
  match f with
  | Server s -> "Server: " ^ s
  | ContentLength l -> "Content-Length: " ^ string_of_int l
  | ContentType ct -> "Content-Type: " ^ ct
  | Date d -> "Date: " ^ string_of_date d
  | Expires e -> "Expires: " ^ string_of_expires e
  | Location uri -> "Location: " ^ string_of_uri uri
  | LastModified lm -> "Last-Modified: " ^ string_of_date lm
  | TransferEncoding te -> "Transfer-Encoding: " ^ string_of_transferEncoding te

(* response *)

type response = {
    status : status;
    headers : field list;
    body : string;
}

let string_of_response r =
  string_of_status r.status ^ "\r\n" ^
  String.concat "\r\n" (List.map string_of_field (r.headers)) ^
  "\r\n\r\n" ^
  r.body

let my_response = {
    status = {
        version = "HTTP/1.1";
        code = 418;
    };
    headers = [
        Server "gws";
        ContentLength 1024;
        ContentType "text/html; charset=UTF-8";
        Date {
            dayOfWeek = "Fri";
            dayOfMonth = 30;
            month = "Mar";
            year = 2018;
            hour = 20;
            minute = 16;
            second = 32;
            timeZone = "CEST"
        };
        (* Expires (Number ~1), *)
        Date {
            dayOfWeek = "Thu";
            dayOfMonth = 29;
            month = "Mar";
            year = 2019;
            hour = 16;
            minute = 28;
            second = 26;
            timeZone = "CEST";
        };
        Location {
            scheme = "http"; (* obvezno polje, zato spredaj nima "SOME" *)
            host = Some (IPV6 ("0000", "1234", "abcd", "01ab", "ffff", "9999", "534e", "a3f1"));
            (* host = Some (IPV4 (127, 0, 0, 1)); *)
            (* host = Some (HostName ["google"; "si"]); *)
            user = Some "admin";
            password = Some "ultra_safe_password_1A!";
            port = None; (* to polje ni podano *)
            path = ["web"; "page"];
            query = [("a", "b"); ("x", "y")];
            fragment = Some "top"
        };
        TransferEncoding Gzip;
    ];
    body = "Content of the web page.";
};; (* ti podpičji sta obvezni, saj sledi nerezervirana beseda *)

(* prikažimo my_response *)
print_string (string_of_response my_response)
