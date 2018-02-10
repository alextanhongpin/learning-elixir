# WARNING: Deprecated
defmodule Forwarder do
  use GenEvent

  def handle_event(event, parent) do
    send parent, event
    {:ok, parent}
  end
end


# iex
# import_file "03-gen-event.ex"
# GenEvent.add_handler(event_manager, Forwarder, self())
# GenEvent.sync_notify(event_manager, :ping)
# flush