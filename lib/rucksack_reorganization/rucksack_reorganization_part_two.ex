defmodule RucksackReorganizationPartTwo do
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

  def sum_groups_of_rucksacks(rucksacks),
    do:
      rucksacks
      |> Enum.chunk_every(3)
      |> Enum.map(fn chunkced_rucksacks -> find_repeating_character(chunkced_rucksacks) end)
      |> Enum.map(fn item -> get_character_score(item) end)
      |> List.flatten()
      |> Enum.sum()

  defp containsCharacter(character, r1, r2),
    do: String.contains?(r1, character) && String.contains?(r2, character)

  defp find_repeating_character(rucksacks),
    do:
      String.split(Enum.at(rucksacks, 0), "")
      |> Enum.filter(fn char -> char != "" end)
      |> find_repeating_character(Enum.at(rucksacks, 1), Enum.at(rucksacks, 2))

  defp find_repeating_character([head | tail], rucksack_one, rucksack_two) do
    if containsCharacter(head, rucksack_one, rucksack_two) do
      head
    else
      find_repeating_character(tail, rucksack_one, rucksack_two)
    end
  end

  defp get_character_score(character),
    do: get_character_score(character, String.contains?(@lower_case_alphabet, character))

  defp get_character_score(character, true),
    do: get_character_score(character, @lower_case_alphabet_with_character_score)

  defp get_character_score(character, false),
    do: get_character_score(character, @upper_case_alphabet_with_character_score)

  defp get_character_score(character, alphabet),
    do:
      alphabet
      |> Enum.filter(fn {char, _} -> character == char end)
      |> Enum.map(fn {_, index} -> index end)
end
