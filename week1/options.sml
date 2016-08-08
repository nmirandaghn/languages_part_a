fun countdown(x: int) =
  if x <= 0 then []
  else
      x :: countdown(x - 1);

fun countup(x: int) =
  let
      fun count(from: int) =
	if from = x then from::[]
	else
	    from :: count(from + 1)
  in
      count 1
  end;

fun old_max(xs: int list) =
  if null xs then 0
  else if null(tl xs) then hd xs
  else
      let
	  val tl_ans = old_max(tl xs)
      in
	  if hd(xs) > tl_ans then hd xs
	  else
	      tl_ans
      end;
      
      
