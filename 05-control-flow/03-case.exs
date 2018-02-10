my_list = [1, 2, 3, 4]

out = case my_list do
  [a, 2, b, 4] -> "a: #{a}, b: #{b}"
  _ -> "Nothing"
end

IO.inspect out, label: "out"