class Bussine < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :user, presence: true
  validates :telefono, presence: true
  validates :direccion, presence: true
  validates :email, email: true
end
