require 'rails_helper'

RSpec.describe "Learning Resources", :vcr do
  describe 'Search' do

    describe 'learning resources per country' do
      it 'returns a video and photos ' do
        get "/api/v1/learning_resources?country=laos"

        expect(response).to be_successful

        resources = JSON.parse(response.body, symbolize_names: true)

        expect(resources).to be_a Hash
        expect(resources).to have_key(:data)
        expect(resources[:data]).to be_a Hash

        expect(resources[:data]).to have_key(:id)
        expect(resources[:data][:id]).to be_nil

        expect(resources[:data]).to have_key(:type)
        expect(resources[:data][:type]).to be_a String
        
        expect(resources[:data]).to have_key(:attributes) 
        expect(resources[:data][:attributes]).to be_a Hash

        expect(resources[:data][:attributes]).to have_key(:country)
        expect(resources[:data][:attributes][:country]).to be_a String

        expect(resources[:data][:attributes]).to have_key(:video)
        expect(resources[:data][:attributes][:video]).to be_a Hash

        expect(resources[:data][:attributes][:video]).to have_key(:title)
        expect(resources[:data][:attributes][:video][:title]).to be_a String

        expect(resources[:data][:attributes][:video]).to have_key(:youtube_video_id)
        expect(resources[:data][:attributes][:video][:youtube_video_id]).to be_a String

        expect(resources[:data][:attributes]).to have_key(:images)
        expect(resources[:data][:attributes][:images]).to be_a Array

        resources[:data][:attributes][:images].each do |image|
          expect(image).to have_key(:alt_tag)
          expect(image[:alt_tag]).to be_a String
          
          expect(image).to have_key(:url)
          expect(image[:url]).to be_a String
        end

      end
    end

  end
end