require 'rails_helper'

RSpec.describe  Api::V1::UsersController, type: :request do
    describe "POST /users" do 
        before :each do
            auth = { provider: "facebook", uid: "1234453", info: { name: "Andrés", email: "hola@andresdominguez.me" } }
            post "/api/v1/users", {auth: auth} 
        end

        it { have_http_status(200) }
        
        it { change(User,:count).by(1) }
        
        it "responds with the user found or created" do
            json = JSON.parse(response.body)
            #puts "\n\n\n\n ---- #{json} --- \n\n\n"
            expect(json["email"]).to eq("hola@andresdominguez.me")
        end
    end
end