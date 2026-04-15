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

type tencoding = Chunked | Compress | Deflate | Gzip | Identity

let string_of_tencoding te =
    match te with
    | Chunked -> "chunked"
    | Compress -> "compress"
    | Deflate -> "deflate"
    | Gzip -> "gzip"
    | Identity -> "identity"

type dayname = | Mon | Tue | Wed | Thu | Fri | Sat | Sun 
let string_of_dayname dn =
    match dn with
    | Mon -> "Mon"
    | Tue -> "Tue" 
    | Wed -> "Wed" 
    | Thu -> "Thu" 
    | Fri -> "Fri" 
    | Sat -> "Sat" 
    | Sun -> "Sun" 
type month = | Jan | Feb | Mar | Apr | May | Jun | Jul | Aug | Sep | Oct | Nov | Dec
let string_of_month m =
    match m with
    | Jan -> "Jan" 
    | Feb -> "Feb" 
    | Mar -> "Mar" 
    | Apr -> "Apr" 
    | May -> "May" 
    | Jun -> "Jun" 
    | Jul -> "Jul" 
    | Aug -> "Aug" 
    | Sep -> "Sep" 
    | Oct -> "Oct" 
    | Nov -> "Nov"
    | Dec -> "Dec"
type timeofday = { hour : int; minute: int; second : int }
let digit2 i =
    if i < 10
    then "0" ^ string_of_int i
    else string_of_int i

let digit2' i =
    (if i < 10 then "0" else "") ^ string_of_int i

let string_of_timeofday tod =
    digit2 tod.hour ^ ":" ^ digit2 tod.minute ^ ":" ^ digit2 tod.second
 
type timezone = GMT
let string_of_timezone GMT = "GMT"

(* Sun, 06 Nov 1994 08:49:37 GMT  *)
type date = {
    day_name : dayname;
    day : int;
    month : month;
    year : int;
    time_of_day : timeofday;
    timezone : timezone;
}
let string_of_date d =
    string_of_dayname d.day_name 
    ^ ", " ^ 
    digit2 d.day
    ^ " " ^ 
    string_of_month d.month
    ^ " " ^ 
    string_of_int d.year
    ^ " " ^ 
    string_of_timeofday d.time_of_day
    ^ " " ^ 
    string_of_timezone d.timezone

type field =
    | Server of string
    | ContentLength of int
    | ContentType of string
    | TransferEncoding of tencoding
    | Date of date
    | Expires of date
    | LastModified of date
    | Location of string

type response = {status: status; headers: field list; body: string}

let string_of_field f =
    match f with
    | Server name -> "Server: " ^ name
    | ContentLength length -> "Content-Length: " ^ string_of_int length
    | ContentType s -> "Content-Type: " ^ s
    | TransferEncoding te -> "Transfer-Encoding: " ^ string_of_tencoding te
    | Date s -> "Date: " ^ string_of_date s
    | Expires s -> "Expires: " ^ string_of_date s
    | LastModified s -> "Last-Modified: " ^ string_of_date s
    | Location s -> "Location: " ^ s

let r = {
    status={version="HTTP/1.1"; code=200};
    headers=[
        Server "nginx/1.6.2";
        ContentLength 13;
        Expires 
        {
            day_name = Sun;
            day = 19;
            month = Nov;
            year = 1978;
            time_of_day = {hour = 5; minute = 0; second = 0};
            timezone = GMT;
        };
        ContentType "text/html; charset=utf-8";
        TransferEncoding Identity;
        ];
    body="hello world!\n"
}
let string_of_response r =
    string_of_status r.status
    ^ "\n" ^ 
    String.concat "\n" (List.map string_of_field r.headers)
    ^ "\n" ^ 
    r.body