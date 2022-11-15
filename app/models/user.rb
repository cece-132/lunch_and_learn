class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :api_key
  
  validates :email, uniqueness: true
  validates :api_key, uniqueness: true

end