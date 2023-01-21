# frozen_string_literal: true

module ServerHelper
  def score_game(ct_side, t_side)
    "#{ct_side}:#{t_side}"
  end

  def total_online
    Server.sum(:count_users)
  end
end
