defmodule CampCleanup do
  def num_of_pairs_in_range(pairs) do
    pairs |> Enum.map(fn pair -> String.split_at(pair, 3) end)
  end
end
