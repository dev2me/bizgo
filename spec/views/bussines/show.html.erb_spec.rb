=begin
require 'rails_helper'

RSpec.describe "bussines/show", type: :view do
  before(:each) do
    @bussine = assign(:bussine, Bussine.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Direccion/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Telefono/)
    expect(rendered).to match(/Telefono Sec/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Twitter/)
    expect(rendered).to match(/Facebook/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/false/)
  end
end
=end
