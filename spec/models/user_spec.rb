require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    # it { should validate_uniqueness_of(:email) }
    # it { should validate_uniqueness_of(:api_key) }
  end

  describe 'instance methods' do
    describe '#favorites' do
      it 'returns a users favorites' do
        user = create(:user)
        favorites = create_list(:favorite, 5, api_key: user.api_key)

        expect(user.favorites.count).to eq 5
        expect(user.favorites).to eq(favorites)
      end
    end
  end
end