class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :api_key

  validates :email, uniqueness: true
  validates :api_key, uniqueness: true

  before_validation :assign_api_key

  private
    def assign_api_key
      if api_key.nil?
        self.api_key = rand(36**36).to_s(36)
      end
    end

end