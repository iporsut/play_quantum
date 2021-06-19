import Config

config :logger, level: :debug

config :play_quantum, PlayQuantum.Scheduler,
  overlap: false,
  run_strategy: {Quantum.RunStrategy.Random, :cluster},
  execution_broadcaster_name: {:global, PlayQuantum.Scheduler.ExecutionBroadcaster},
  jobs: [
    # Every 5 seconds
    {{:extended, "*/5"}, {PlayQuantum.Scheduler, :hello_world, []}}
  ]
