class User < ActiveRecord::Base
    validates :email, presence: true, email: true, uniqueness: true
    validates :name,:provider,:uid, presence: true
    has_many :tokens
    has_many :bussines
    enum nivel: [:usuario, :socio, :admin_bizgo]
    has_attached_file :avatar, styles: {medium: "300x300", thumb: "100x100"}
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    
    def self.from_omniauth(data)
        User.where(provider: data[:provider], uid: data[:uid]).first_or_create do |user| 
            user.email = data[:info][:email]
            user.name = data[:info][:name]
        end
    end

end
