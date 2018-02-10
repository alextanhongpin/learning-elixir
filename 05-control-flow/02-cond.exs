x = cond do
  2 + 2 == 5 -> "2 + 2 = 5"
  2 * 2 == 5 -> "2 * 2 = 5"
  2 * 2 == 4 -> "2 * 2 = 4"
end

IO.inspect x, label: "x"

a = 5
b = 0

c = cond do
  a + b > 10 ->
    c = b + a - 10
  a + b < 10 ->
    c = 10
end

IO.inspect c, label: "c"