class User < ActiveRecord::Base
    validates :email, presence: true, email: true, uniqueness: true
    validates :name,:provider,:uid, presence: true
    has_many :tokens
    has_many :bussines
    enum nivel: [:usuario, :socio]
    
    def self.from_omniauth(data)
        User.where(provider: data[:provider], uid: data[:uid]).first_or_create do |user| 
            user.email = data[:info][:email]
            user.name = data[:info][:name]
        end
    end

end
