class UserSerializer

  def self.format_user(user)
    {
      data: {
        type: user.class.to_s.downcase,
        id: user.id,
        attributes: {
          name: user.name,
          email: user.email,
          api_key: user.api_key
        }
      }
    }
  end

end