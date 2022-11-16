class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :api_key

  validates :email, uniqueness: true
  validates :api_key, uniqueness: true

  self.primary_key = 'api_key'

  before_validation :assign_api_key

  def favorites
    Favorite.where(api_key: self.api_key)
  end

  private
    def assign_api_key
      if api_key.nil?
        self.api_key = rand(36**36).to_s(36)
      end
    end

end