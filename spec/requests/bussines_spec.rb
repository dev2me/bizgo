require 'rails_helper'

RSpec.describe  Api::V1::BussinesController, type: :request do

  describe "GET /bussines" do
    before :each do
      FactoryGirl.create_list(:bussine,2)
      get api_v1_bussines_path
    end
   
    it {expect(response).to have_http_status(200)}
    
    it "show JSON of bussines" do
      #puts "\n\n\n\n  --- #{response.body} --- \n\n\n\n"
      json = JSON.parse(response.body)
      expect(json["data"].length).to eq(Bussine.count)
    end
  end

  describe "GET /bussines/:id" do
    before :each do
      @bussine = FactoryGirl.create(:bussine)
      get api_v1_bussine_path(@bussine)
    end
    
    it {expect(response).to have_http_status(200)}
    it "responde con el modelo solicitado" do 
      json = JSON.parse(response.body)
      #puts "\n\n\n --- #{json} --- \n\n\n"
      expect(json["data"]["id"]).to eq(@bussine.id)
    end
    it "manda los atributos del modelo" do
      json = JSON.parse(response.body)
      expect(json["data"].keys).to contain_exactly("id", "name", "description", "user_id","direccion", "telefono", "telefono_sec", "website", "twitter", "facebook", "email", "active", "expires_at","lunes", "open_lunes_morning", "close_lunes_morning", "open_lunes_afternon", "close_lunes_afternon", "martes", "open_martes_morning", "close_martes_morning", "open_martes_afternon", "close_martes_afternon", "miercoles", "open_miercoles_morning", "close_miercoles_morning", "open_miercoles_afternon", "close_miercoles_afternon", "jueves", "open_jueves_morning", "close_jueves_morning", "open_jueves_afternon", "close_jueves_afternon", "viernes", "open_viernes_morning", "close_viernes_morning", "open_viernes_afternon", "close_viernes_afternon", "sabado", "open_sabado_morning", "close_sabado_morning", "open_sabado_afternon", "close_sabado_afternon", "domingo", "open_domingo_morning", "close_domingo_morning", "open_domingo_afternon", "close_domingo_afternon", "user")
    end
  end
  
  describe "POST /bussines" do
    context "with valid session" do
      before :each do
        @token = FactoryGirl.create(:token, expires_at: DateTime.now + 1.month)
        post api_v1_bussines_path, { token: @token.token, bussine: { name: "Hola mundo", description: "La mejor", direccion: "Denfesa Popular", telefono: "1234567890", email: "hola@andresdominguez.me"} }
      end
      it {expect(response).to have_http_status(200)}
     
      it "crea un nuevo negocio" do 
        bizgo = {name: "Hola mundo", description: "La mejor", direccion: "Denfesa Popular", telefono: "1234567890", email: "hola@example.com"}
        expect{
          #token = FactoryGirl.create(:token, expires_at: DateTime.now + 1.month, user_id: FactoryGirl.create(:dummy_user))
          post api_v1_bussines_path, { token: @token.token, bussine: bizgo }
        }.to change(Bussine,:count).by(1)
        
      end
      it "responde con el negocio creado" do
        json = JSON.parse(response.body)
        expect(json["data"]["name"]).to eq("Hola mundo")
      end
    end
    context "with invalid session" do
      before :each do
        token = FactoryGirl.create(:token, expires_at: DateTime.now - 1.month)
        post api_v1_bussines_path,{ token: token.token, bussine: { name: "Hola mundo", description: "La mejor", direccion: "Denfesa Popular", telefono: "1234567890", email: "hola@example.com"} }
      end
      it {expect(response).to have_http_status(401)}
    end
    context "invalid params" do 
      before :each do
        token = FactoryGirl.create(:token)
        post api_v1_bussines_path, { token: token.token, bussine: { description: "La mejor" } }
      end
      it {expect(response).to have_http_status(422)}
      it "responde con los errores" do
        #puts "\n\n\n -- #{response.body} --- \n\n\n"
        json = JSON.parse(response.body)
        expect(json["errors"]).to_not be_empty
      end
    end
  end
  
  describe "PATCH /bussines/:id" do
    #before :each do
    #end
    
    context "with a token valid" do
      before :each do
        @token = FactoryGirl.create(:token, expires_at: DateTime.now + 1.month)
        @bussine = FactoryGirl.create(:bussine, user: @token.user)
        patch api_v1_bussine_path(@bussine), { token: @token.token, bussine: {name: "Este es mi nuevo nombre"}}
      end
      it {expect(response).to have_http_status(200)}
      
      it "update the model " do 
        json = JSON.parse(response.body)
        expect(json["data"]["name"]).to eq("Este es mi nuevo nombre")
      end
    end
    
     context "with a token invalid" do
      before :each do
        @token = FactoryGirl.create(:token, expires_at: DateTime.now + 1.month)
        @bussine = FactoryGirl.create(:bussine, user: FactoryGirl.create(:dummy_user))
        patch api_v1_bussine_path(@bussine), { token: @token.token, bussine: {name: "Este es mi nuevo nombre"}}
      end
      it {expect(response).to have_http_status(401)}
    end
  end

  describe "DELETE /bussines/:id" do
    context "with a token valid" do
      before :each do
        @token = FactoryGirl.create(:token, expires_at: DateTime.now + 1.month)
        @bussine = FactoryGirl.create(:bussine, user: @token.user)
        delete api_v1_bussine_path(@bussine)
      end

      it { expect(response).to have_http_status(200); puts "\n\n\n\n --- #{response.body} --- \n\n\n"}
    end
    context "with a token invalid" do
      before :each do
        @token = FactoryGirl.create(:token, expires_at: DateTime.now - 1.month)
        @bussine = FactoryGirl.create(:bussine, user: @token.user)
        delete api_v1_bussine_path(@bussine)
      end
      it { expect(response).to have_http_status(401)}
    end
  end
end