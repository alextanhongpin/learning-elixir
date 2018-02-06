square = fn x -> x * x end
IO.inspect square.(2), label: "square of 2"

IO.inspect (fn x, y, z -> x + y + z end).(2, 6, 8), label: "sum of three numbers"
IO.inspect (&(&1 + &2 + &3)).(2, 6, 8), label: "sum of three numbers"