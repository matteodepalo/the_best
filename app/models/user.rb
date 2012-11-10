class User < ActiveRecord::Base
  attr_accessible :name, :email

  def self.from_omniauth(auth)
    where(:uid => auth['uid'], :provider => auth['provider']).first || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.token = auth['credentials']['token']

      if info = auth['info']
        user.name = info['name'] || ''
        user.email = info['email'] || ''
      end
    end
  end
end
