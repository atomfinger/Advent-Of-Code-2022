defmodule RockPaperScissor do
  @move_score %{"A" => 1, "B" => 2, "C" => 3}
  @win_score 6
  @draw_score 3

  def calculate_score(strategy) do
    Enum.map(strategy, fn strategy_code -> String.split(strategy_code) end)
    |> calculate_strategy_score(0)
  end

  defp get_winning_move(move) do
    case move do
      "A" -> "B"
      "B" -> "C"
      _ -> "A"
    end
  end

  defp get_loss_move(move) do
    case move do
      "A" -> "C"
      "B" -> "A"
      _ -> "B"
    end
  end

  defp get_draw_move(move) do
    move
  end

  defp get_move_score(move, strategy) do
    strategy_score = case strategy do
      "X" -> {get_loss_move(move), 0}
      "Y" -> {get_draw_move(move), @draw_score}
      _ -> {get_winning_move(move), @win_score}
    end
    move_score = @move_score[elem(strategy_score, 0)]
    move_score + elem(strategy_score, 1)
  end

  defp calculate_strategy_score([], score) do score end

  defp calculate_strategy_score([[move, strategy] | tails], score) do
    calculate_strategy_score(tails, get_move_score(move, strategy) + score)
  end
end
