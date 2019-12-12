defmodule WorldTemp.Application do
  @moduledoc false

  use Application

  alias WorldTemp.{CityProducer, TempProcessor, TempTracker}

  def start(_type, _args) do
    children = [
      TempTracker,
      CityProducer,
      TempProcessor
    ]

    opts = [strategy: :one_for_one, name: WorldTemp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
