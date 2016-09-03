=begin
require "rails_helper"

RSpec.describe Api::V1::BussinesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/bussines").to route_to("bussines#index")
    end

    it "routes to #new" do
      expect(:get => "/bussines/new").to route_to("bussines#new")
    end

    it "routes to #show" do
      expect(:get => "/bussines/1").to route_to("bussines#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/bussines/1/edit").to route_to("bussines#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/bussines").to route_to("bussines#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/bussines/1").to route_to("bussines#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/bussines/1").to route_to("bussines#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/bussines/1").to route_to("bussines#destroy", :id => "1")
    end

  end
end
=end