{pid, _} = spawn_monitor(fn -> :timer.sleep(500) end)

Process.alive?(pid)
