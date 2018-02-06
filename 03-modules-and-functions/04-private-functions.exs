defmodule MyMath do
  def square(x) do
    do_square(x)
  end

  defp do_square(x), do: x * x
end

IO.inspect MyMath.square(2), label: "Square of 2"