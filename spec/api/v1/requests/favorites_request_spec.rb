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

      favorite = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq 201
      expect(favorite).to eq({ "success": "Favorite added successfully" })
    end
  end

  describe 'Sad Path' do
    it 'return 401 status if api_key missing' do
      user = create(:user)
      get "/api/v1/recipes?country=french"

      headers = {"CONTENT_TYPE" => "application/json"}

      recipe = JSON.parse(response.body, symbolize_names: true)[:data].first

      favorite_params = {
                        # "api_key": user.api_key,
                        "country": recipe[:attributes][:country],
                        "recipe_link": recipe[:attributes][:url],
                        "recipe_title": recipe[:attributes][:title]
                        }

      post "/api/v1/favorites", headers: headers, params: JSON.generate(favorite: favorite_params)

      favorite = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq 404
      expect(favorite).to eq({ error: 'Unsuccessful Favorite Creation' })
    end
  end

  describe 'Viewing a users favorites' do
    it 'returns all of a users favorites' do
      user = create(:user)
      favorite = create_list(:favorite, 10, api_key: user.api_key)

      get "/api/v1/favorites/#{user.api_key}"

      expect(response).to be_successful

      favorites = JSON.parse(response.body, symbolize_names: true)

      expect(favorites).to be_a Hash
      expect(favorites).to have_key(:data)
      expect(favorites[:data]).to be_a Array

      favorites[:data].each do |favorite|
        expect(favorite).to be_a Hash
        expect(favorite).to have_key(:id)
        expect(favorite[:id]).to be_a String

        expect(favorite).to have_key(:type)
        expect(favorite[:type]).to be_a String

        expect(favorite).to have_key(:attributes)
        expect(favorite[:attributes]).to be_a Hash

        expect(favorite[:attributes]).to have_key(:recipe_title)
        expect(favorite[:attributes][:recipe_title]).to be_a String

        expect(favorite[:attributes]).to have_key(:recipe_link)
        expect(favorite[:attributes][:recipe_link]).to be_a String

        expect(favorite[:attributes]).to have_key(:country)
        expect(favorite[:attributes][:country]).to be_a String
        
        expect(favorite[:attributes]).to have_key(:created_at)
        expect(favorite[:attributes][:created_at]).to be_a String
      end
    end
  end

end