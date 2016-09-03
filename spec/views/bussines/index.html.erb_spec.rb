=begin
require 'rails_helper'

RSpec.describe "bussines/index", type: :view do
  before(:each) do
    assign(:bussines, [
      Bussine.create!(
        :name => "Name",
        :description => "MyText",
        :lunes => false,
        :martes => false,
        :miercoles => false,
        :jueves => false,
        :viernes => false,
        :sabado => false,
        :domingo => false,
        :user => nil,
        :direccion => "Direccion",
        :longitud => 2.5,
        :latitud => 3.5,
        :telefono => "Telefono",
        :telefono_sec => "Telefono Sec",
        :website => "Website",
        :twitter => "Twitter",
        :facebook => "Facebook",
        :email => "Email",
        :active => false
      ),
      Bussine.create!(
        :name => "Name",
        :description => "MyText",
        :lunes => false,
        :martes => false,
        :miercoles => false,
        :jueves => false,
        :viernes => false,
        :sabado => false,
        :domingo => false,
        :user => nil,
        :direccion => "Direccion",
        :longitud => 2.5,
        :latitud => 3.5,
        :telefono => "Telefono",
        :telefono_sec => "Telefono Sec",
        :website => "Website",
        :twitter => "Twitter",
        :facebook => "Facebook",
        :email => "Email",
        :active => false
      )
    ])
  end

  it "renders a list of bussines" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Direccion".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "Telefono".to_s, :count => 2
    assert_select "tr>td", :text => "Telefono Sec".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
=end