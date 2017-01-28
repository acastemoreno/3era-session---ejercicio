defmodule Tercera.Worker do
  use GenServer

  def estado() do
    GenServer.call(__MODULE__, :estado)
  end

  def incrementar_estado(delta) do
    GenServer.cast(__MODULE__, {:incrementar, delta})
  end

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    estado = GenServer.call(Tercera.Generic, :obtener_estado)
    {:ok, estado}
  end

  def handle_call(:estado, _from, estado) do
    {:reply, estado, estado+1}
  end

  def handle_cast({:incrementar, delta}, estado) do
    {:noreply, estado+delta}
  end

  def terminate(_reason, estado) do
    GenServer.cast(Tercera.Generic, {:actualizar_estado, estado})
  end
end
