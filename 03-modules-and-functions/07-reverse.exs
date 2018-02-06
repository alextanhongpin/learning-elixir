defmodule Reverse do
  def reverse([]), do: []
  def reverse([h|t]), do: reverse(t) ++ [h]
end

IO.inspect Reverse.reverse([1,2,3,4]), label: "Reverse"