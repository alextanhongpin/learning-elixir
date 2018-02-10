# $ iex
# iex > import_file "07-stateful.exs"
# iex > pid = KV.start_link
# iex > Process.register(pid, :kv)
# iex > send :kv, {:put, :a, 42, self}
# iex > send :kv {:get, :a, self}
# iex > flush