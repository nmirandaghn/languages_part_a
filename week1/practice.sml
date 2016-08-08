fun alternate(xs: int list) =
  let
      fun inner(xs: int list, y: int) =
	if null xs then 0
	else
	    let
		val x = if hd(xs) mod 2 = 0 then 0 - hd(xs) else hd(xs)
	    in
		x + inner(tl xs, y + 1)
	    end
  in
      inner(xs, 1)
  end;

fun max(xs: int list) =
  if null xs then 0
  else
      let val mf = max(tl xs)
      in
	  if hd xs > mf then
	      hd xs
	  else
	      mf
      end;

fun min(xs: int list) =
  let
      fun helper(xs: int list, min: int) =
	if null xs then min
	else if hd xs < min then
	    helper(tl xs, hd xs)
	else
	    helper(tl xs, min)
  in
      helper(tl xs, hd xs)
  end;
	  
fun min_max(xs: int list) =
  (min xs, max xs);


					 
					 
