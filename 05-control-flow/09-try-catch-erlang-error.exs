try do
  :erlang.error "More oops"
catch
  error -> IO.puts :stderr, "Error received: #{inspect error}"
end
