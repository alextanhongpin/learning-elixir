IO.inspect 1..10 |> Stream.map(fn(x) -> x * x end), label: "Stream"

IO.inspect 1..100 |> Stream.filter(fn(x) -> rem(x, 2) != 0 end) |> Stream.take(10) |> Enum.to_list, label: "Take 10 odd"
IO.inspect 1..100 |> Stream.filter(fn(x) -> rem(x, 2) != 0 end) |> Enum.take(10), label: "Take 10 odd"

stream_f = fn() -> 1..1000 |> 
  Stream.filter(fn(x) -> rem(x, 2) != 0 end) |> 
  Enum.take(10) 
end

enum_f = fn() -> 1..1000 |>
  Enum.filter(fn(x) -> rem(x, 2) != 0 end) |>
  Enum.take(10)
end

IO.inspect :timer.tc(stream_f), label: "stream_f"
IO.inspect :timer.tc(enum_f), label: "enum_f"
IO.inspect stream_f.(), label: "stream_f"
IO.inspect enum_f.(), label: "enum_f"
