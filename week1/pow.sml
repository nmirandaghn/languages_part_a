fun pow(x: int, y: int) =
       if y <= 0 then 1
       else
	   x * pow(x, y - 1)

fun cube(x: int) = pow(x, 3);

fun myfunc(x: int, y: int, z: int) = x + y + z;

val sixtyfour = cube(4);

val value = (2, 3);
