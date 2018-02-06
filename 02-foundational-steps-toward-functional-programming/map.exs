defmodule MyMap do
  def map([], _) do
    []
  end

  def map([h|t], f) do
    [f.(h) | map(t, f)]
  end
end

square = fn x -> x * x end
IO.inspect MyMap.map([1, 2, 3, 4, 5], square), label: "map"


defmodule Parallel do
  def pmap(collection, func) do
    collection
    |> Enum.map(&(Task.async(fn -> func.(&1) end)))
    |> Enum.map(&Task.await/1)
  end
end

square = fn x -> x * x end
IO.inspect Parallel.pmap([1, 2, 3, 4, 5], square), label: "map"
