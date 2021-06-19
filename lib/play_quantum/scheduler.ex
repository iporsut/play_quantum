defmodule PlayQuantum.Scheduler do
  use Quantum,
    otp_app: :play_quantum

  def hello_world() do
    IO.puts("Hello #{inspect(Time.utc_now())}")
  end
end
