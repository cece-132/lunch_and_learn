require 'rails_helper'

RSpec.describe "Users CRUD" do
  describe 'Create User' do
    it 'can create a user' do

      user_params = (
                      {
                        "name": "Athena Dao",
                        "email": "athenadao@bestgirlever.com"
                      }
                    )
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

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

      expect(User.all.count).to eq 1
    end
  end

  describe 'Update User' do
    it 'can update an existing user' do
      user = create(:user)

      previous_name = User.last.name

      user_params = { name: "New Name" }
      headers = {"CONTENT_TYPE" => "application/json"}

      put "/api/v1/users/#{user.id}", headers: headers, params: JSON.generate({user: user_params})

      user = JSON.parse(response.body, symbolize_names: true)
      updated_user = User.last
      
      expect(response).to be_successful
      expect(updated_user.name).to_not eq previous_name
      expect(updated_user.name).to eq "New Name"
    end
  end

  describe 'Delete User' do
    it 'can delete a user from the database' do
      users = create_list(:user, 2)
      user_to_be_deleted = users[1].id

      expect(User.count).to eq(2)

      delete "/api/v1/users/#{users[1].id}"

      expect(response).to have_http_status(204)
      expect(User.count).to eq(1)
      expect{User.find(user_to_be_deleted)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'Show' do
    it 'can show one users information' do
      user = create(:user)

      get "/api/v1/users/#{user.id}"

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

  describe 'Index' do
    it 'returns all the users in the database' do
      create_list(:user, 10)

      get '/api/v1/users'

      expect(response).to be_successful

      users = JSON.parse(response.body, symbolize_names: true)

      expect(users).to be_a Hash
      expect(users).to have_key(:data)
      expect(users[:data]).to be_a Array

      users[:data].each do |user|
        expect(user).to have_key(:type)
        expect(user[:type]).to be_a String
        
        expect(user).to have_key(:id)
        expect(user[:id]).to be_a String

        expect(user).to have_key(:attributes)
        expect(user[:attributes]).to be_a Hash

        expect(user[:attributes]).to have_key(:name)
        expect(user[:attributes][:name]).to be_a String

        expect(user[:attributes]).to have_key(:email)
        expect(user[:attributes][:email]).to be_a String

        expect(user[:attributes]).to have_key(:api_key)
        expect(user[:attributes][:api_key]).to be_a String
      end

    end
  end

end