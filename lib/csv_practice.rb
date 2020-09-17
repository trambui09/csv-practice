require 'csv'
require 'awesome_print'



def get_all_olympic_athletes(filename)
  # path is "data/athlete_events.csv" not "../data/athlete_events.csv"
  athletes_arr_of_hashes = CSV.read("data/athlete_events.csv", headers: true).map(&:to_h)
  # select a subset of keys from the CSV file w/this format
  selected_keys = athletes_arr_of_hashes.map do |athlete|
    athlete.select{|key, content | %w(ID Name Height Team Year City Sport Event Medal).include? key}
  end

  return selected_keys
end

def total_medals_per_team(olympic_data)
  country_and_medals_hash = {}
  olympic_data.map do |row|
    # assign the country_name value for the Team key as the variable country_name
    country_name = row["Team"]
    # nested if loops, go through each row, if the Medal key value has gold,silver, or brozen enter the if loop
    if %w(Gold Silver Bronze).include?(row["Medal"])
      # check if the key is already in the hash, increment if yes : if key isn't in hash, make a new key and assign it 1
      country_and_medals_hash.has_key?(country_name) ? country_and_medals_hash[country_name] += 1 : country_and_medals_hash[country_name] = 1
    end
  end

  return country_and_medals_hash

end

def get_all_gold_medalists(olympic_data)
end
