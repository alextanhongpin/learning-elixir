file_name = "non_existant.txt"

case File.read file_name do
  {:ok, contents} -> IO.puts contents
  {:error, reason} -> IO.puts :stderr, "Couldn't open file #{file_name} because: #{reason}"
end

result = File.open!("config_file")

case File.open "config_file" do
  {:ok, contents} -> IO.puts contents
  # File must be always available
  {:error, reason} -> raise "Failed to open config file: #{reason}"
end