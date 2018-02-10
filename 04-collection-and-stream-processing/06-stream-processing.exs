defmodule MyMap do
  def map([], _), do: []
  def map([h|t], f), do: [f.(h) | map(t, f)]
end


IO.inspect MyMap.map([1, 2, 3, 4, 5], fn (x) -> x * x end), label: "Basic map"
IO.inspect MyMap.map(Enum.to_list(1..5), fn (x) -> x * x end), label: "Enum to list"
IO.inspect 1..5 |> Enum.to_list |> MyMap.map(fn(x) -> x * x end), label: "Pipeline"
IO.inspect 1..5 |> Enum.map(fn(x) -> x * x end), label: "Enum map"