my_key_list = [a: 1, b: 2]

IO.inspect my_key_list, label: "my_key_list"

IO.inspect Keyword.put(my_key_list, :c, 3), label: "Keyword.put"
# IO.inspect Dict.put(my_key_list, :c, 3), label: "Dict.put"


IO.inspect Keyword.put(my_key_list, :a, 3), label: "Keyword.put"
# IO.inspect Dict.put(my_key_list, :a, 3), label: "Dict.put"

my_map = %{:a => 1, 'b' => 'c'}
IO.inspect Map.put(my_map, :a, 3), label: "Map.put"
IO.inspect %{my_map | :a => 3}, label: "Map.put"