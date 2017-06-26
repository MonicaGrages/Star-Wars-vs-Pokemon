class StarWar < ApplicationRecord
  include HTTParty
  base_uri 'http://swapi.co/api/people'

#this is a class method (bc self.)
  def self.generate api_id
    #We don't need StarWar. before find_by because this is a class method
    star_war = find_by(api_id: api_id)
    #break out of this method if we already got that same star war so we can get it from our db instead of third party star wars api
    return star_war unless star_war.nil?

    #bc star wars api
    placeholder_image = "https://www.placecage.com/c/#{200 + api_id}/#{200 + api_id}"
    #this gets appended to the base_uri
    response = get("/#{api_id}")

    #JSON is always a string as the key
    # puts response["name"]

    #this instance will be returned because it's the last line
    create!(name: response['name'],
            image: placeholder_image,
            wins: 0,
            api_id: api_id)
  end

end
