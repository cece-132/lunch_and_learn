require 'rails_helper'

Rspec.describe "Users Registration" do
  describe 'Create User' do
    it 'can create a user' do

      user_params = (
                      {
                        "name": "Athena Dao",
                        "email": "athenadao@bestgirlever.com"
                      }
                    )
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: JSON.generate(item: user_params)

      expect(response).to be_successful

      user = JSON.parse(response.body, symbolize_names: true)
      
      expect(user).to be_a Hash
      expect(user).to have_key(:data)
      expect(user[:data]).to have_key(:type)
      expect(user[:data]).to have_key(:id)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to have_key(:name)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes]).to have_key(:api_key)
    end
  end

end

#generates random letter and numbers rand(36**8).to_s(36)