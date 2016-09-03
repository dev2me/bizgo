FactoryGirl.define do
  factory :bussine do
    association :user, factory: :user
    name "Comercial Mexicana"
    description "Comercial mexicana de comercio"
    lunes false
    open_lunes_morning "2016-08-20 17:24:12"
    close_lunes_morning "2016-08-20 17:24:12"
    open_lunes_afternon "2016-08-20 17:24:12"
    close_lunes_afternon "2016-08-20 17:24:12"
    martes false
    open_martes_morning "2016-08-20 17:24:12"
    close_martes_morning "2016-08-20 17:24:12"
    open_martes_afternon "2016-08-20 17:24:12"
    close_martes_afternon "2016-08-20 17:24:12"
    miercoles false
    open_miercoles_morning "2016-08-20 17:24:12"
    close_miercoles_morning "2016-08-20 17:24:12"
    open_miercoles_afternon "2016-08-20 17:24:12"
    close_miercoles_afternon "2016-08-20 17:24:12"
    jueves false
    open_jueves_morning "2016-08-20 17:24:12"
    close_jueves_morning "2016-08-20 17:24:12"
    open_jueves_afternon "2016-08-20 17:24:12"
    close_jueves_afternon "2016-08-20 17:24:12"
    viernes false
    open_viernes_morning "2016-08-20 17:24:12"
    close_viernes_morning "2016-08-20 17:24:12"
    open_viernes_afternon "2016-08-20 17:24:12"
    close_viernes_afternon "2016-08-20 17:24:12"
    sabado false
    open_sabado_morning "2016-08-20 17:24:12"
    close_sabado_morning "2016-08-20 17:24:12"
    open_sabado_afternon "2016-08-20 17:24:12"
    close_sabado_afternon "2016-08-20 17:24:12"
    domingo false
    open_domingo_morning "2016-08-20 17:24:12"
    close_domingo_morning "2016-08-20 17:24:12"
    open_domingo_afternon "2016-08-20 17:24:12"
    close_domingo_afternon "2016-08-20 17:24:12"
    user nil
    direccion "MyString"
    longitud 1.5
    latitud 1.5
    telefono "MyString"
    telefono_sec "MyString"
    website "MyString"
    twitter "MyString"
    facebook "MyString"
    active false
    expires_at "2016-08-20 17:24:12"
  end
end
