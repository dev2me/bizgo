require 'rails_helper'

RSpec.describe Bussine, type: :model do
  it { should validate_presence_of(:name) } 
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:user) } 
  it { should belong_to(:user) }
  it { should validate_presence_of(:direccion) }
  it { should validate_presence_of(:telefono) }
  it { should_not allow_value("hola@andresdominguez").for(:email) }
  it { should_not allow_value("hola@").for(:email) }
  it { should allow_value("hola@andresdominguez.me").for(:email) }
end
