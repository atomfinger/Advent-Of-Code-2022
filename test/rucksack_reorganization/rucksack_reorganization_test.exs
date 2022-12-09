defmodule RucksackReorganizationTest do
  use ExUnit.Case

  doctest RucksackReorganization

  test "Given test input we should be able to get the exepcted output" do
    input = [
      "vJrwpWtwJgWrhcsFMMfFFhFp",
      "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
      "PmmdzqPrVvPwwTWBwg",
      "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
      "ttgJtRGJQctTZtZT",
      "CrZsJsPPZsGzwwsLwLmpwMDw"
    ]

    result = RucksackReorganization.sum_same_item_types_in_each_rucksack(input)

    assert result == 157
  end

  test "Given full test input we should be able to get the expected output" do
    input = ReadDataset.read_dataset("rucksack_reorganization.txt")

    result = RucksackReorganization.sum_same_item_types_in_each_rucksack(input)

    assert result == 7824
  end
end
