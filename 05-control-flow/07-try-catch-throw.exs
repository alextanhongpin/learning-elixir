try do
  throw :fails
catch 
  :throw, value -> IO.puts :stderr, "Failure in above code: #{inspect value}" 
end