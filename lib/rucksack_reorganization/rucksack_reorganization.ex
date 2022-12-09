defmodule RucksackReorganization do
  @lower_case_alphabet "abcdefghijklmnopqrstuvwxyz"
  @lower_case_alphabet_with_character_score String.split(@lower_case_alphabet, "")
                                            |> Enum.filter(fn char -> char != "" end)
                                            |> Enum.with_index()
                                            |> Enum.map(fn {character, index} ->
                                              {character, index + 1}
                                            end)

  @upper_case_alphabet "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  @upper_case_alphabet_with_character_score String.split(@upper_case_alphabet, "")
                                            |> Enum.filter(fn char -> char != "" end)
                                            |> Enum.with_index()
                                            |> Enum.map(fn {character, index} ->
                                              {character, index + 27}
                                            end)

  def sum_same_item_types_in_each_rucksack(rucksacks) do
    Enum.map(rucksacks, fn rucksack -> split_rucksack_content(rucksack) end)
    |> Enum.map(fn rucksack_items -> get_matching_character(rucksack_items) end)
    |> Enum.map(fn item -> get_character_score(item) end)
    |> List.flatten()
    |> Enum.sum()
  end

  defp split_rucksack_content(rucksack) do
    middle = String.length(rucksack) |> div(2)
    String.split_at(rucksack, middle)
  end

  defp get_matching_character({characters1, characters2}) do
    chars1 = String.split(characters1, "")
    # chars2 = String.split(characters2)
    Enum.filter(chars1, fn char -> char != "" && String.contains?(characters2, char) end)
    |> Enum.uniq()
  end

  defp get_character_score([character]) do
    cond do
      String.contains?(@lower_case_alphabet, character) ->
        get_character_score(character, @lower_case_alphabet_with_character_score)

      String.contains?(@upper_case_alphabet, character) ->
        get_character_score(character, @upper_case_alphabet_with_character_score)
    end
  end

  defp get_character_score(character, alphabet) do
    Enum.filter(
      alphabet,
      fn {char, _index} -> character == char end
    )
    |> Enum.map(fn {_char, index} -> index end)
  end
end
