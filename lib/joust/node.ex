defmodule Joust.Node do
  @moduledoc """
  Node is any type of node within a bracket.
  It will most likely be used for matches right now, but there could be other uses.
  """

  # Maybe instead of a struct, it could just be a tuple of values?
  # Might be easier in the long run instead of creating structs.
  # {Node, Node, NodePayload}
  defstruct [
    :left,
    :right,
    :root,
    :payload,
    :name
  ]

  # Probably not necessary, but a nice-to-have I'm sure... :thinking:
  def create_root do
    %__MODULE__{
      root: true
    }
  end

  def append(node, side, new_node) do
    case side do
      :left ->
        Map.put(node, :left, new_node)

      :right ->
        Map.put(node, :right, new_node)
    end
  end
end
