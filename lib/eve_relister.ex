defmodule Relister do
  @moduledoc """
  Documentation for Relister.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Relister.hello
      :world

  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    children = [
      supervisor(Relister.Repo, [])
    ]
    opts = [strategy: :one_for_one, name: Relister.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def hello do
    :world
  end
end
