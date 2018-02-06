defmodule Flatten do
  @moduledoc """
  Documentation for Flatten.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Flatten.flatten [[1, 2], [3], [4, 5]]
      [1, 2, 3, 4, 5]

  """
  def flatten([]), do: []
  def flatten([h|t]) when is_list(h), do: h ++ flatten(t)
  def flatten([h|t]), do: [h] ++ flatten(t)
end
