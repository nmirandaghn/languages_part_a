fun is_older(date1: (int * int * int), date2: (int * int * int)) =
  #3(date1) < #3(date2) orelse
  (#3(date1) <= #3(date2) andalso #2(date1) < #2(date2)) orelse
  (#3(date1) <= #3(date2) andalso #2(date1) <= #2(date2) andalso
	   #1(date1) < #1(date2));

fun number_in_month(xs: (int * int * int) list, x: int) =
  if null xs then 0
  else
      let
	  val mf = number_in_month(tl(xs), x)
      in
	  if #2(hd(xs)) = x then 1 + mf
          else mf
      end;
	  
fun number_in_months(xs: (int * int * int) list, ys: int list) =
  if null ys then 0
  else
      number_in_month(xs, hd(ys)) + number_in_months(xs, tl(ys));

fun dates_in_month(xs: (int * int * int) list, x: int) =
  if null xs then []
  else
      let
	  val mf = dates_in_month(tl(xs), x)
      in
	  if #2(hd(xs)) = x then hd(xs) :: mf
          else mf
      end;

fun dates_in_months(xs: (int * int * int) list, ys: int list) =
  if null ys then []
  else
      dates_in_month(xs, hd(ys)) :: dates_in_months(xs, tl(ys));

fun get_nth(xs: string list, n: int) =
  let
      fun inner(ys: string list, x: int) =
        if x = n then
	    hd(ys)
	else
	    inner(tl(ys), x + 1)
  in
      inner(xs, 1)
  end;

fun date_to_string(year: int, month: int, day: int) =
  let
    val months = ["January", "February", "March", "April",
                  "May", "June", "July", "August",
                  "September", "October", "November", "December"]
  in
      get_nth(months, month) ^ " " ^ Int.toString(day) ^ ", " ^ Int.toString(year)
  end;
      
