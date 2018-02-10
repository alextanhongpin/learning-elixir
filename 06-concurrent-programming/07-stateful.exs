defmodule KV do
  def start_link do
    spawn_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:put, key, value, sender} ->
        new_map = Map.put(map, key, value)
        send sender, :ok
        loop(new_map)
      {:get, key, sender} ->
        send sender, Map.get(map, key)
        loop(map)
    end
  end
end

# $ iex
# iex > import_file "07-stateful.exs"
# iex > pid = KV.start_link
# iex > send pid, {:get, :a, self}
# iex > flush