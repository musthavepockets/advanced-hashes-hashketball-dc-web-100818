require "pry"

def game_hash
  { :home => { :team_name => "Brooklyn Nets", :colors => ["Black", "White"], :players => { "Alan Anderson" => {  :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1 }, "Reggie Evans" => { :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7 }, "Brook Lopez" => { :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15 }, "Mason Plumlee" => { :number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5 }, "Jason Terry" => { :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1 } } },  :away => { :team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"], :players => { "Jeff Adrien" => { :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2 }, "Bismak Biyomobo" => { :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10 }, "DeSagna Diop" => { :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5 }, "Ben Gordon" => { :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0}, "Brendan Haywood" => { :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12 } } } }
end


def num_points_scored(player_name)
  points_scored = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.include?(player_name)
          points_scored = data[player_name][:points]
      end
    end
  end
  points_scored
end


def shoe_size(player_name)
  size = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.include?(player_name)
        size << data[player_name][:shoe] 
      end
    end
  end
  size
end


def team_colors(team_name)
  colors = nil
  game_hash.each do |location, team_data|
    if team_data.values.include?(team_name)
      colors = team_data[:colors]
    end
  end
  colors
end

def team_names
  names = []
  game_hash.each do |location, team_data|
    names << team_data[:team_name]
  end
  names
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        team_data[:players].each do |name, data_item|
          numbers << data_item[:number]
        end
      end
    end
  end  
  numbers
end

def player_stats(player_name)
  statistics = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.is_a?(Hash) 
        data.each do |name, player_data|
          player_data.each do |key, value|
            if name == player_name
              statistics = player_data
              #binding.pry
            end
          end
        end
      end
    end
  end
  statistics
end


def big_shoe_rebounds
  rebounds = []
  player = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      team_data[:players].each do |name, data_item|
          player = team_data[:players].find do |name|
            data_item.values_at(:shoe).max
            rebounds = data_item[:rebounds]
        end
      end
    end
  end
  rebounds
end
