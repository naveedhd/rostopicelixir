defmodule Rostopicelixir do
  @moduledoc """
  Documentation for `Rostopicelixir`.
  """
  require Logger

  @doc """
  Hello world.

  ## Examples

      iex> Rostopicelixir.hello()
      :world

  """
  def hello do
    :world
  end

  def get_system_state() do
    call =
      case Xenium.call("http://localhost:11311", "getSystemState", ["/script"]) do
        {:error, reason} ->
          raise "Error contacting ROS Master! Is `roscore` running? #{
            inspect(reason)
          }"

        response ->
          response
      end

    call
    |> inspect
    |> Logger.debug()

    call
  end

  def main(_) do
    IO.puts(get_system_state())
  end
end
