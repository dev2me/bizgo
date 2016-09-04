class Bussine < ActiveRecord::Base 
  reverse_geocoded_by :latitud, :longitud
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :user, presence: true
  validates :telefono, presence: true
  validates :direccion, presence: true
  validates :email, email: true
  #after_validation :reverse_geocode
end
