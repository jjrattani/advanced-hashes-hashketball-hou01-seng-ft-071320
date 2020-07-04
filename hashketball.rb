# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

def num_points_scored(player_name)
  #player could be home or away
  game_hash.each do |parent_key,parent_hash|
    #parent key is home or away 
    #parent value is statistics within the home and away keys
    game_hash[parent_key][:players].each do |player_hash|
      if player_name == player_hash[:player_name]
        return player_hash[:points]
      end
    end
  end
  return nil
end

def shoe_size(player_name)
  #player could be home or away
  game_hash.each do |parent_key,parent_hash|
    #parent key is home or away 
    #parent value is statistics within the home and away keys
    game_hash[parent_key][:players].each do |player_hash|
      if player_name == player_hash[:player_name]
        return player_hash[:shoe]
      end
    end
  end
  return nil
end

def team_colors(team_name)
  game_hash.each do |parent_key,team_hash|
    if team_name == team_hash[:team_name]
      return team_hash[:colors]
    end
  end
  return nil
end

def team_names
  return [
    game_hash[:home][:team_name],
    game_hash[:away][:team_name]
    ]
end

def player_numbers(team_name)
  game_hash.each do |game_key,team_hash|
    if team_name == team_hash[:team_name]
      numbers = []
      team_hash[:players].each do |player_jersey_number|
        numbers.push(player_jersey_number[:number])
      end
      return numbers
    end
  end
  return nil
end

def player_stats(player_name)
  game_hash.each do |parent_key,parent_hash|
    #parent key is home or away 
    #parent value is statistics within the home and away keys
    game_hash[parent_key][:players].each do |player_hash|
      if player_name == player_hash[:player_name]
        return player_hash
      end
    end
  end
  return nil
end

def big_shoe_rebounds
  largest_shoe_size = 0
  player_stats = nil
  game_hash.each do |parent_key,parent_hash|
    parent_hash[:players].each do |player_data|
      if largest_shoe_size == 0 && !player_stats
        largest_shoe_size = player_data[:shoe]
        player_stats = player_data
      else
        if player_data[:shoe] > largest_shoe_size
          largest_shoe_size = player_data[:shoe]
          player_stats = player_data
        end
      end
    end
  end
  
  return player_stats[:rebounds]
end

def most_points_scored
  largest_points = 0
  player_stats = nil
  game_hash.each do |parent_key,parent_hash|
    parent_hash[:players].each do |player_data|
      if largest_points == 0 && !player_stats
        largest_points = player_data[:points]
        player_stats = player_data
      else
        if player_data[:points] > largest_points
          largest_points = player_data[:points]
          player_stats = player_data
        end
      end
    end
  end
  
  return player_stats[:points]
end

def winning_team
  home_team_points = 0
  away_team_points = 0
  
  game_hash[:away][:players].each do |player_data|
    away_team_points = away_team_points + player_data[:points]
  end
  
  game_hash[:home][:players].each do |player_data|
    home_team_points = home_team_points + player_data[:points]
  end
  
  if home_team_points > away_team_points
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end
  
def player_with_longest_name
  longest_name = nil
  longest_name_size = 0
  game_hash.each do |parent_key, parent_hash|
    parent_hash[:players].each do |player_data|
      puts "#{player_data[:player_name]} --- #{"
      if !longest_name && longest_name_size == 0
        longest_name = player_data[:player_name]
        longest_name_size = player_data[:player_name].length
      else
        if player_data[:player_name].length > longest_name_size
          longest_name_size = player_data[:player_name].length
          longest_name = player_data[:player_name]
        end
      end
    end
  end
  return longest_name
end
      
    

