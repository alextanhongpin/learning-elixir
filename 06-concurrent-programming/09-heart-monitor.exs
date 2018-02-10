defmodule HeartMonitor do
  def start_link do
    spawn_link(fn -> 
      loop(%{:monitors => [], :alive => [], :dead => [], :pending => %{}})
    end)
  end

  defp loop(state) do
    receive do
      {:ping, sender} ->
        loop(handle_pong(sender, state))
      {:monitor, pid} ->
        loop(%{state | :monitors => [pid] ++ state.monitors})
      {:demonitor, pid} ->
        loop(%{state | :monitors => state.monitors -- [pid]})
      {:list_monitors, sender} ->
        send sender, {:reply, state.monitors}
        loop(state)
      {:list_alive, sender} ->
        send sender, {:reply, state.alive}
        loop(state)
      {:list_dead, sender} ->
        send sender, {:reply, state.dead}
        loop(state)
      after 3000 ->
        loop(send_ping(state))
    end
    # loop
  end

  defp send_ping(state) do
    pending = state.monitors |>
      Enum.map(fn(p) ->
        send p, {:ping, self()}
        Map.update(state.pending, p, 1, fn(count) -> count + 1 end) 
      end) |>
      Enum.reduce(%{}, fn(x, acc) -> 
        Map.merge(x, acc, fn(_, v1, v2) -> v1 + v2 end)
      end)

      dead = (pending |> 
        Enum.filter(fn({p, c}) -> (not p in state.dead) and c > 2 end) |>
        Enum.map(fn({p, _}) -> p end)) ++ state.dead
      
      %{state | :pending => pending, :dead => dead}
  end

  defp handle_pong(sender, state) do
    dead = state.dead -- [sender]
    pending = Map.delete(state.pending, sender)
    if sender in state.dead do
      IO.puts("Process #{inspect sender} was dead but is now alive")
    end

    alive = unless sender in state.alive do
      [sender] ++ state.alive
    else
      state.alive
    end

    %{state | :alive => alive, :dead => dead, :pending => pending}  
  end
end

# $ iex
# iex > import_file "09-heart-monitor.exs"
# iex > pid = HeartMonitor.start_link
# iex > send pid, {:monitor, self}
# iex > flush