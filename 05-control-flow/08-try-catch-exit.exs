try do
  exit :oops
catch
  :exit, code -> IO.puts :stderr, "Exited: #{inspect code}"
end