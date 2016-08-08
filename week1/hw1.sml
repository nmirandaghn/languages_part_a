fun is_older(date1: (int * int * int), date2: (int * int * int)) =
  (#1(date1) < #1(date2)) orelse
  (#1(date1) <= #1(date2) andalso #2(date1) < #2(date2)) orelse
  (#1(date1) <= #1(date2) andalso #2(date1) <= #2(date2) andalso #3(date1) < #3(date2));

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
      dates_in_month(xs, hd(ys)) @ dates_in_months(xs, tl(ys));

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
      
fun number_before_reaching_sum(sum: int, xs: int list) =
  let
      fun sumInt(s: int, b: int, ys: int list) =
	if s >= sum then b
	else sumInt(s + hd(ys), b + 1, tl(ys))
  in
      sumInt(hd(xs), 0, tl(xs))
  end;

fun what_month(x: int) =
  let
      val months = [31,28,31,30,31,30,31,31,30,31,30,31]
  in
      number_before_reaching_sum(x, months) + 1
  end;

fun month_range(day1: int, day2: int) =
  if day1 > day2 then []
  else
      what_month(day1) :: month_range(day1 + 1, day2);

fun oldest(xs: (int * int * int) list) =
  if null xs then NONE
  else
      let
	  fun max_nonempty(xs: (int * int * int) list) =
	    if null(tl xs) then hd xs
	    else
		let val ans_tl = max_nonempty(tl xs)
		in
		    if is_older(hd xs, ans_tl) then
			hd xs
		    else
			ans_tl
		end
      in
	  SOME(max_nonempty xs)
      end;


fun number_in_months_challenge(xs: (int * int * int) list, ys: int list) =
  let
      fun rd(dl: int list) =
	if null dl then []
	else
	    let val mf = rd(tl dl)
	    in
		if hd dl = mf then
		    rd(tl dl)
		else
		    hd dl
	    end
  in
      number_in_months(xs, rd ys)
  end;
      
		

(*
fun dates_in_month(xs: (int * int * int) list, x: int) = ???;
*)      
    
fun oldest1(xs: (int * int * int) list) =
  if null xs then
      NONE
  else
      let val tl_ans = oldest(tl xs)
      in
	  if isSome(tl_ans) andalso is_older(hd xs, valOf(tl_ans)) then
	      tl_ans
	  else
	      SOME(hd xs)
      end;
