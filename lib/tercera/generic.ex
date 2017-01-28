defmodule Tercera.Generic do
  use GenServer

  ## APi
  def start_link(estado_inicial) do
    GenServer.start_link(__MODULE__, estado_inicial, name: __MODULE__)
  end

  ## Implementación GenServer
  def init(numero) do
    {:ok, numero}
  end

  def handle_call(:obtener_estado,_from, estado) do
    {:reply, estado, estado}
  end

  def handle_cast({:actualizar_estado, nuevo_estado}, _estado) do
    {:noreply, nuevo_estado}
  end
end
