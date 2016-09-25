require 'rails_helper'

RSpec.describe "Plans", type: :request do
  describe "GET /plans" do
  	before :each do
    	FactoryGirl.create_list(:plan,10)
    	get api_v1_plans_path
	end
	it {expect(response).to have_http_status(200)}
	it "show JSON of plans" do
      json = JSON.parse(response.body)
      expect(json["data"].length).to eq(Plan.count)
    end
  end
end
