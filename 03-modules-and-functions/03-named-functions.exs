defmodule MyMath do
  def square(x) do
    x * x
  end
end

IO.inspect MyMath.square(2), label: "Square of 2"