=begin
require 'rails_helper'

RSpec.describe "bussines/new", type: :view do
  before(:each) do
    assign(:bussine, Bussine.new(
      :name => "MyString",
      :description => "MyText",
      :lunes => false,
      :martes => false,
      :miercoles => false,
      :jueves => false,
      :viernes => false,
      :sabado => false,
      :domingo => false,
      :user => nil,
      :direccion => "MyString",
      :longitud => 1.5,
      :latitud => 1.5,
      :telefono => "MyString",
      :telefono_sec => "MyString",
      :website => "MyString",
      :twitter => "MyString",
      :facebook => "MyString",
      :email => "MyString",
      :active => false
    ))
  end

  it "renders new bussine form" do
    render

    assert_select "form[action=?][method=?]", bussines_path, "post" do

      assert_select "input#bussine_name[name=?]", "bussine[name]"

      assert_select "textarea#bussine_description[name=?]", "bussine[description]"

      assert_select "input#bussine_lunes[name=?]", "bussine[lunes]"

      assert_select "input#bussine_martes[name=?]", "bussine[martes]"

      assert_select "input#bussine_miercoles[name=?]", "bussine[miercoles]"

      assert_select "input#bussine_jueves[name=?]", "bussine[jueves]"

      assert_select "input#bussine_viernes[name=?]", "bussine[viernes]"

      assert_select "input#bussine_sabado[name=?]", "bussine[sabado]"

      assert_select "input#bussine_domingo[name=?]", "bussine[domingo]"

      assert_select "input#bussine_user_id[name=?]", "bussine[user_id]"

      assert_select "input#bussine_direccion[name=?]", "bussine[direccion]"

      assert_select "input#bussine_longitud[name=?]", "bussine[longitud]"

      assert_select "input#bussine_latitud[name=?]", "bussine[latitud]"

      assert_select "input#bussine_telefono[name=?]", "bussine[telefono]"

      assert_select "input#bussine_telefono_sec[name=?]", "bussine[telefono_sec]"

      assert_select "input#bussine_website[name=?]", "bussine[website]"

      assert_select "input#bussine_twitter[name=?]", "bussine[twitter]"

      assert_select "input#bussine_facebook[name=?]", "bussine[facebook]"

      assert_select "input#bussine_email[name=?]", "bussine[email]"

      assert_select "input#bussine_active[name=?]", "bussine[active]"
    end
  end
end
=end