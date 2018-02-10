x = 42

y = if x > 0 do
  x * -1
end

IO.inspect y, label: "y"

z = if true do
  x = 42
  y = x + 8
  z = x + y - 42
  z
end

IO.inspect z, label: "z"