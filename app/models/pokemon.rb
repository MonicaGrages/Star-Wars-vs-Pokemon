class Pokemon < ApplicationRecord
  include HTTParty
  base_uri 'http://pokeapi.co/api/v2/pokemon'

  def self.generate api_id
    pokemon = find_by(api_id: api_id)
    return pokemon unless pokemon.nil?

    placeholder_image = "https://www.placecage.com/c/#{200 + api_id}/#{200 + api_id}"
    #this gets appended to the base_uri
    response = get("/#{api_id}")

    #this instance will be returned because it's the last line
    create!(name: response['name'].capitalize,
            image: response['sprites']['front_default'],
            wins: 0,
            api_id: api_id)
  end


end
