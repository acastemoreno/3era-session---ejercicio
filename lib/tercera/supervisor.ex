defmodule Tercera.Supervisor do
  use Supervisor

  def start_link(numero) do
    Supervisor.start_link(__MODULE__, numero, name: __MODULE__)
  end

  def init(numero) do
    children = [
      worker(Tercera.Generic, [numero]),
      supervisor(Tercera.SubSupervisor, [])
    ]

    # supervise/2 is imported from Supervisor.Spec
    supervise(children, strategy: :one_for_one)
  end
end
