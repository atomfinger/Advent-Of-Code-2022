defmodule RockPaperScissorTest do
  use ExUnit.Case

  doctest RockPaperScissor

  test "Given a strategy guide we should be able to calculate score" do
    input = [
      "A Y",
      "B X",
      "C Z"
    ]

    score = RockPaperScissor.calculate_score(input)

    assert score == 12
  end

  test "Verify score with teh entire dataset" do
    input = ReadDataset.read_dataset("rock_paper_scissor.txt")

    score = RockPaperScissor.calculate_score(input)

    assert score == 13889
  end
end
