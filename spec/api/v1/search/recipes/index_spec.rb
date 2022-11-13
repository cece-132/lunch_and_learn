require 'rails_helper'

RSpec.describe "Recipes", :vcr do
  describe 'Search' do
    describe 'Cuisine from specific contries' do
      it 'returns all the foods from a specific country' do
        
        get "/api/v1/recipes?country=french"

        expect(response).to be_successful

        recipes = JSON.parse(response.body, symbolize_names: true)

        expect(recipes).to be_a Hash
        expect(recipes).to have_key(:data)
        expect(recipes[:data]).to be_a Array
        expect(recipes[:data].count).to eq 10

        recipes[:data].each do |recipe|
          expect(recipe).to have_key(:id)
          expect(recipe[:id]).to eq(nil)

          expect(recipe).to have_key(:type)
          expect(recipe[:type]).to be_a String
          expect(recipe[:type]).to eq "recipe"

          expect(recipe).to have_key(:attributes)
          expect(recipe[:attributes]).to have_key(:title)
          expect(recipe[:attributes][:title]).to be_a String

          expect(recipe[:attributes]).to have_key(:url)
          expect(recipe[:attributes][:url]).to be_a String

          expect(recipe[:attributes]).to have_key(:country)
          expect(recipe[:attributes][:country]).to be_a String

          expect(recipe[:attributes]).to have_key(:image)
          expect(recipe[:attributes][:image]).to be_a String
        end
      end
    end
  end
end