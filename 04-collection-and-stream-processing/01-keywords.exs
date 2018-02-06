alist = [{:a, 0}, {:b, 1}]
IO.inspect alist == [a: 0, b: 1], label: "Compare"
IO.inspect alist[:a], label: "Get key :a"

IO.inspect alist ++ {:c, 2}, label: "Add keywords"

blist = [{:a, 1}] ++ alist
IO.inspect blist, label: "New list"
IO.inspect Keyword.get_values(blist, :a), label: "Get multiple values by key"