defmodule CalorieCountingTest do
  use ExUnit.Case

  doctest CalorieCounting

  test "Given elfs that carries calories we shoudl be able to calculate the elf that carries the most" do
    input = [
      "1000",
      "2000",
      "3000",
      "",
      "4000",
      "",
      "5000",
      "6000",
      "",
      "7000",
      "8000",
      "9000",
      "",
      "10000"
    ]

    result = CalorieCounting.find_highest_calorie_count_carried(input)

    assert result == 45000
  end


  test "Given a real dataset then we should get the correct result" do
    input = ReadDataset.read_dataset("calorie_counting.txt")

    result = CalorieCounting.find_highest_calorie_count_carried(input)

    assert result == 202585
  end
end
