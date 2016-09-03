require 'rails_helper'

RSpec.describe  Api::V1::BussinesController, type: :request do

  describe "GET /bussines" do
    before :each do
      FactoryGirl.create_list(:bussine, 10)
      get "/api/v1/bussines"
    end
   
    it {expect(response).to have_http_status(200)}
    
    it "show JSON of bussines" do
      #puts "\n\n\n\n  --- #{response.body} --- \n\n\n\n"
      json = JSON.parse(response.body)
      expect(json.length).to eq(Bussine.count)
    end
  end
end