defmodule PlayQuantum.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    topologies = [
      example: [
        strategy: Cluster.Strategy.Epmd,
        config: [hosts: [:"a@127.0.0.1", :"b@127.0.0.1", :"c@127.0.0.1"]]
      ]
    ]

    children = [
      {Cluster.Supervisor, [topologies, [name: PlayQuantum.ClusterSupervisor]]},
      PlayQuantum.Scheduler
    ]

    opts = [strategy: :one_for_one, name: PlayQuantum.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
