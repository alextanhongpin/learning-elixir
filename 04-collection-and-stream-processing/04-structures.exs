defmodule Foo do
  defstruct bar: 'foobar', answer: 42
end

# IO.inspect %Foo{}, label: "Foo struct"