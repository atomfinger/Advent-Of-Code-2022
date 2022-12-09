defmodule CalorieCounting do
  def find_highest_calorie_count_carried(elfs) do
    sorted_calories =
      elfs
      |> Enum.map(fn count -> String.trim(count) end)
      |> Enum.map(fn count -> parse_calorie_count(count) end)
      |> sum_calories(0, [])
      |> Enum.sort(:desc)

    Enum.at(sorted_calories, 0) + Enum.at(sorted_calories, 1) + Enum.at(sorted_calories, 2)
  end

  defp parse_calorie_count("") do
    :divider
  end

  defp parse_calorie_count(calorie_count) do
    Integer.parse(calorie_count) |> elem(0)
  end

  defp sum_calories([], currently_carrying, carrying_list) do
    [currently_carrying | carrying_list]
  end

  defp sum_calories([head | tail], currently_carrying, carrying_list) when head == :divider do
    sum_calories(tail, 0, [currently_carrying | carrying_list])
  end

  defp sum_calories([head | tail], currently_carrying, carrying_list) do
    sum_calories(tail, currently_carrying + head, carrying_list)
  end
end
