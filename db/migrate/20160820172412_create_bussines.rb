class CreateBussines < ActiveRecord::Migration
  def change
    create_table :bussines do |t|
      t.string :name
      t.text :description
      t.boolean :lunes
      t.time :open_lunes_morning
      t.time :close_lunes_morning
      t.time :open_lunes_afternon
      t.time :close_lunes_afternon
      t.boolean :martes
      t.time :open_martes_morning
      t.time :close_martes_morning
      t.time :open_martes_afternon
      t.time :close_martes_afternon
      t.boolean :miercoles
      t.time :open_miercoles_morning
      t.time :close_miercoles_morning
      t.time :open_miercoles_afternon
      t.time :close_miercoles_afternon
      t.boolean :jueves
      t.time :open_jueves_morning
      t.time :close_jueves_morning
      t.time :open_jueves_afternon
      t.time :close_jueves_afternon
      t.boolean :viernes
      t.time :open_viernes_morning
      t.time :close_viernes_morning
      t.time :open_viernes_afternon
      t.time :close_viernes_afternon
      t.boolean :sabado
      t.time :open_sabado_morning
      t.time :close_sabado_morning
      t.time :open_sabado_afternon
      t.time :close_sabado_afternon
      t.boolean :domingo
      t.time :open_domingo_morning
      t.time :close_domingo_morning
      t.time :open_domingo_afternon
      t.time :close_domingo_afternon
      t.references :user, index: true, foreign_key: true
      t.string :direccion
      t.float :longitud
      t.float :latitud
      t.string :telefono
      t.string :telefono_sec
      t.string :website
      t.string :twitter
      t.string :facebook
      t.string :email
      t.boolean :active
      t.datetime :expires_at

      t.timestamps null: false
    end
  end
end
