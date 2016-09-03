require 'rails_helper'

RSpec.describe User, type: :model do
    it { should validate_presence_of(:name) } 
    it { should validate_presence_of(:email) } 
    it { should_not allow_value("hola@andresdominguez").for(:email) }
    it { should_not allow_value("hola@").for(:email) }
    it { should allow_value("hola@andresdominguez.me").for(:email) }
    it { should validate_presence_of(:provider) } 
    it { should validate_presence_of(:uid) } 
    it { should validate_uniqueness_of(:email)}
    
    it "debería crear un usuario si el uid y el provider no existen" do
        expect{
            User.from_omniauth({ uid: "12344566", provider: "facebook", info: { name: "Andres", email: "hola@andresdominguez.mx" } })
        }.to change(User,:count).by(1)
    end
    
    it 'debería encontrar un suaurio si el uid y provider ya existen' do
        user = FactoryGirl.create(:user)
        expect{
            User.from_omniauth({uid: user.uid, provider: user.provider, info: { name: "Andres", email: "hola@andresdominguez.me" }})
        }.to change(User,:count).by(0)
    end
    
    
    it 'deberia retornar el usuario encontrado si el uid y el provider ya existen' do 
        user = FactoryGirl.create(:user)
        expect(
            User.from_omniauth({ uid: user.uid, provider: user.provider })
        ).to eq(user)
    end
end