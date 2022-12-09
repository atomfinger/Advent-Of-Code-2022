defmodule CampCleanupTest do
  use ExUnit.Case

  doctest CampCleanup

  test "Verify pairs in range" do
    input = [
      "2-4,6-8",
      "2-3,4-5",
      "5-7,7-9",
      "2-8,3-7",
      "6-6,4-6",
      "2-6,4-8"
    ]

    result = CampCleanup.num_of_pairs_in_range(input)

    assert result == 2
  end
end
