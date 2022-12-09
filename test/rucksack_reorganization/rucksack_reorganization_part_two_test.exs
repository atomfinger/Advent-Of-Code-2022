defmodule RucksackReorganizationPArtTwoTest do
  use ExUnit.Case

  doctest RucksackReorganizationPartTwo

  test "Given test input we should be able to get the exepcted output" do
    input = [
      "vJrwpWtwJgWrhcsFMMfFFhFp",
      "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
      "PmmdzqPrVvPwwTWBwg",
      "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
      "ttgJtRGJQctTZtZT",
      "CrZsJsPPZsGzwwsLwLmpwMDw"
    ]

    result = RucksackReorganizationPartTwo.sum_groups_of_rucksacks(input)

    assert result == 70
  end

  test "Given full test input we should be able to get the expected output" do
    input = ReadDataset.read_dataset("rucksack_reorganization.txt")

    result = RucksackReorganizationPartTwo.sum_groups_of_rucksacks(input)

    assert result == 2798
  end
end
