defmodule Tercera do
  use Application

  def start(_type, _args) do
    Tercera.Supervisor.start_link(100)
  end
end
