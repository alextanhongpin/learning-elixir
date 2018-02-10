# one-for-one: restart the process that has died
# one-for-all: restart all of every process when a single process fail
# rest-for-one: restarts all child process, from the failed to the last
# simple one-for-one: stores processes in dictionary compared to one-for-one that stores it in list

defmodule KV.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [worker(KV, [])]

    supervise(children, strategy: :one_for_one)
  end
end