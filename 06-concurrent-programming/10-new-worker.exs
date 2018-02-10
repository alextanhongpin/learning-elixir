defmodule NewWorker do
  def start do
    spawn(fn -> loop() end)
  end

  defp loop do
    receive do
      {:ping, sender} ->
        send sender, {:pong, self()}
        loop()
      {:compute, n, sender} ->
        send sender, {:result, fib(n)}
        loop()
    end
  end

  defp fib(0), do: 0
  defp fib(1), do: 1
  defp fib(n), do: fib(n - 1) + fib(n - 2)
end

# import_file "09-heart-monitor.exs"
# import_file "10-new-worker.exs"

# heart_pid = HeartMonitor.start_link
# w1 = NewWorker.start
# send heart_pid, {:monitor, w1}
# send heart_pid, {:list_alive, self}
# flush

# send w1, {:compute, 5, self}
# flush

# send heart_pid, {:list_alive, self}
# flush

# send w1, {:compute, 40, self}
# flush