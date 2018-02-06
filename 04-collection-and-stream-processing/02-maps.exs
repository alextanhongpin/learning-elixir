my_map = %{'a' => 1, :b => 2, 3 => 5}
IO.inspect my_map, label: "MyMap"

IO.inspect Map.put(my_map, :c, "hello"), label: "Update map"


%{'a' => a, :b => b, 3 => c} = my_map
IO.inspect a, label: "a"
IO.inspect b, label: "b"
IO.inspect c, label: "c"