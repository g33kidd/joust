defmodule Joust.Bracket do
  @moduledoc """
  Bracket is a tree of nodes that make-up a schedule of matches.

  This is basically a conversion of my Crystal implementation of this, but it will likely change.
  Just trying to get it working first.
  """

  alias Joust.Node

  # Note quite sure what all of this information is actually necessary.
  defstruct [
    :nodes,
    :matches,
    :teams,
    :team_size
  ]

  def generate(teams) do
    matches = length(teams) - 1
    rounds = Kernel.trunc(:math.log2(length(teams)))

    root_node =
      Node.create_root()
      |> set_tree(rounds)

    %{
      teams: teams,
      teams_length: length(teams),
      matches: matches,
      rounds: rounds,
      node: root_node
    }
  end

  def set_tree(node, 0), do: node

  def set_tree(node, size) do
    left = %Node{}
    right = %Node{}

    left = set_tree(left, size - 1)
    right = set_tree(right, size - 1)

    node
    |> Node.append(:left, left)
    |> Node.append(:right, right)
  end

  defp shuffle_teams(_teams) do
    nil
  end
end
