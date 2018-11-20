defmodule Joust do
  # use Application

  @moduledoc """
  Joust is a system for creating tournament bracket structures.

  These docs are a WIP.
  """

  # TODO: Look into using Supervisors and GenServers for structuring a tournament, maybe
  # TODO: it could be a super useful thing.
  # def start(_type, _args) do
  #   import Supervisor.Spec, warn: false
  #   children = [
  #     supervisor()
  #   ]
  # end

  alias Joust.Node
  alias Joust.Bracket

  def hello do
    teams = 1..24 |> Enum.to_list()
    Bracket.generate(teams)

    # left = %Node{name: "Test_Left"}

    # right =
    #   %Node{name: "Test_Right"}
    #   |> Node.append(:right, left)
    #   |> Node.append(:right, left)

    # Node.create_root()
    # |> Node.append(:left, left)
    # |> Node.append(:right, right)
  end
end
