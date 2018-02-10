me = self
IO.inspect me, label: "me"

send me, :ping

receive do
  x -> IO.puts("#{inspect x}")
end


# IO.inspect flush(), label: "flush"


1..5 |> Enum.map(&(send me, &1 * &1))


receive do
  x -> IO.puts("#{inspect x}")
end