pid = spawn fn -> 6 * 7 end

spawn fn -> raise :oops end

IO.inspect Process.alive?(pid), label: "PID alive"
