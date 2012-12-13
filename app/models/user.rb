class User < ActiveRecord::Base
  # attr_accessible :title, :body

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)

    create! do |user|
      user.provider    = auth["provider"]
      user.uid         = auth["uid"]
      user.first_name  = auth["info"]["first_name"]
      user.last_name   = auth["info"]["last_name"]
      user.token       = auth["credentials"]["token"]
      user.email       = auth["info"]["email"]
      user.location    = auth["info"]["location"]
    end
  end

end
