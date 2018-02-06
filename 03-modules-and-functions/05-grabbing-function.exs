defmodule MyMath do
  def pow(x), do: pow(x, 2)

  def pow(x, p) do
    Enum.reduce(Enum.take(Stream.repeatedly(fn -> x end), p), &*/2)
  end
end

IO.inspect Enum.map([1, 2, 3], &MyMath.pow/1), label: "Power of 2"
IO.inspect Enum.map([1, 2, 3], &MyMath.pow(&1, 3)), label: "Power of 3"


stream = Stream.repeatedly(fn -> 2 end)
IO.inspect stream, label: "Stream of 2"

take5 = Enum.take(stream, 5)
IO.inspect take5, label: "take 5"

sum = Enum.reduce(take5, &*/2)
IO.inspect sum, label: "sum"

