parent = self()

spawn fn -> send(parent, 6 * 7) end

receive do
  x -> IO.puts("got #{inspect x}")
end