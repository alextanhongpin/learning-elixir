k3 = [a: {:b, :c}, b: {:a, :c}, c: {:a, :b}]

IO.inspect k3[:b], label: "k3[:b]"

# Directed acyclic graph (DAG), where `a` is the source and `e` is the sink
dag = [a: {:b, :c}, b: {:c, :d}, c: {:e}, d: {:e}, e: {}]

# To get node ancestors
ancestors = dag |>
  Enum.map(fn({node, neighbours}) ->
    neighbours |> 
    Tuple.to_list |> 
    Enum.map(fn(child) -> { child, node } 
    end) 
  end) |>
  List.flatten |>
  (fn(nodes) -> {nodes |> Keyword.keys |> Enum.uniq, nodes} end).() |>
  (fn({keys, nodes}) -> keys |>
    Enum.map(fn(key) -> 
      {key, nodes |>
        Keyword.get_values(key) |>
        List.to_tuple }
        end) 
      end).()

IO.inspect ancestors, label: "Ancestors"