class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  raise ArgumentError unless game[0].class == Array and game[1].class == Array and game[0][1].class == String and game[1][1].class == String
  strategies = ['r', 'p', 's']
  strategy_0 = game[0][1].downcase
  strategy_1 = game[1][1].downcase
  raise NoSuchStrategyError unless strategies.include? strategy_0 and strategies.include? strategy_1
  
  if strategy_0 == strategy_1
    return game[0]
  else
    case strategy_0
    when 'r'
      if strategy_1 == 's'
        return game[0]
      else
        return game[1]
      end
    when 's'
      if strategy_1 == 'p'
        return game[0]
      else
        return game[1]
      end
    when 'p'
      if strategy_1 == 'r'
        return game[0]
      else
        return game[1]
      end
    end
  end
end

def rps_tournament_winner(tournament)
  if tournament[0][1].class == String and tournament[1][1].class == String
    return rps_game_winner(tournament)
  else
    return rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
  end
end

#feel free to add your own helper functions as needed
