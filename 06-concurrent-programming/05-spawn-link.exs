defmodule Worker do
  def do_work do
    receive do
      {:compute, x, pid} -> send pid, {:result, x * x}
      {:exit, reason} -> exit(reason)
    end
    do_work()
  end
end


pid = spawn_link(Worker, :do_work, [])
IO.inspect pid, label: "pid"

send pid, {:compute, 4, self()}
IO.inspect Process.alive?(pid), label: "Is alive"

send pid, {:exit, :normal}
IO.inspect Process.alive?(pid), label: "Is alive"