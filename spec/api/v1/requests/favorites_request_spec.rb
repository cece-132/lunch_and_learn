require 'rails_helper'

RSpec.describe 'Favorites', :vcr do
  describe 'Adding Favorites' do
    it 'can add favorites' do
      user = create(:user)
      get "/api/v1/recipes?country=french"

      headers = {"CONTENT_TYPE" => "application/json"}

      recipe = JSON.parse(response.body, symbolize_names: true)[:data].first

      favorite_params = {
                        "api_key": user.api_key,
                        "country": recipe[:attributes][:country],
                        "recipe_link": recipe[:attributes][:url],
                        "recipe_title": recipe[:attributes][:title]
                        }

      post "/api/v1/favorites", headers: headers, params: JSON.generate(favorite: favorite_params)

      expect(response.status).to eq 201
      expect(response).to eq({ "success": "Favorite added successfully" })

    end
  end

end