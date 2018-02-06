defmodule Quicksort do
  def quicksort([]), do: []
  def quicksort([h|t]) do
    lower = Enum.filter(t, &(&1 <= h))
    upper = Enum.filter(t, &(&1 > h))
    quicksort(lower) ++ [h] ++ quicksort(upper)
  end
end

IO.inspect Quicksort.quicksort(Enum.shuffle(1..10)), label: "Quicksort"
IO.inspect 1..10 |> Enum.reverse |> Quicksort.quicksort, label: "Quicksort"