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
        
        resources[:data].each do |resource|
          expect(resource).to have_key(:id)
          expect(resource[:id]).to be_nil
          
          expect(resource).to have_key(:type)
          expect(resource[:type]).to be_a String

          expect(resource).to have_key(:attributes) 
          expect(resource[:attributes]).to be_a Hash

          expect(resource[:attributes]).to have_key(:country)
          expect(resource[:attributes][:country]).to be_a String

          expect(resource[:attributes]).to have_key(:video)
          expect(resource[:attributes][:video]).to be_a Hash

          expect(resource[:attributes][:video]).to have_key(:title)
          expect(resource[:attributes][:video][:title]).to be_a String

          expect(resource[:attributes][:video]).to have_key(:youtube_video_id)
          expect(resource[:attributes][:video][:youtube_video_id]).to be_a String

          expect(resource[:attributes]).to have_key(:images)
          expect(resource[:attributes][:images]).to be_a Array
          
          resource[:attributes][:images].each do |image| 
            expect(image).to have_key(:alt_tag)
            expect(image[:alt_tag]).to be_a String
            
            expect(image).to have_key(:url)
            expect(image[:url]).to be_a String
          end
        end

      end
    end

  end
end