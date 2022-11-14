require 'rails_helper'

RSpec.describe "Final Assessment" do
  describe 'Tourist Sights', :vcr do
    it 'can return a list of tourist attractions' do

      get "/api/v1/tourist_sights?country=France"
      
      expect(response).to be_successful

      sights = JSON.parse(response.body, symbolize_names: true)

      expect(sights).to be_a Hash
      expect(sights).to have_key(:data)
      expect(sights[:data]).to be_a Array

      sights[:data].each do |sight|
        expect(sight).to have_key(:id)
        expect(sight[:id]).to be_nil
        
        expect(sight).to have_key(:type)
        expect(sight[:type]).to be_a String
        
        expect(sight).to have_key(:attributes)
        expect(sight[:attributes]).to be_a Hash

        expect(sight[:attributes]).to have_key(:name)
        expect(sight[:attributes][:name]).to be_a String

        expect(sight[:attributes]).to have_key(:address)
        expect(sight[:attributes][:address]).to be_a String

        expect(sight[:attributes]).to have_key(:place_id)
        expect(sight[:attributes][:place_id]).to be_a String
      end
    end

    it 'can validate if the country is valid' do

      get "/api/v1/tourist_sights?country=Frank"
      
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end