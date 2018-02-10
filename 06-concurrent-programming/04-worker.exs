defmodule Worker do
  def do_work() do
    receive do
      {:compute, x, pid} ->
      send pid, {:result, x * x}
    end
    do_work()
  end
end

pid = spawn(Worker, :do_work, [])

send pid, {:compute, 7, self()}

IO.inspect Process.alive?(pid), label: "Is alive?"