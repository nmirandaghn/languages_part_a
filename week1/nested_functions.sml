fun countup_from1(to: int) =
  let
      fun count(from: int) =
	if from = to then to::[]
	else
	   from :: count(from + 1)
  in
      count 1
  end;

fun countup_from1_better(to: int) =
  let
      fun count(from: int) =
	if to = from then to::[]
	else
	   from::count(from + 1)
  in
      count 1
  end;
