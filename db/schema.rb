# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160820172412) do

  create_table "bussines", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "lunes"
    t.time     "open_lunes_morning"
    t.time     "close_lunes_morning"
    t.time     "open_lunes_afternon"
    t.time     "close_lunes_afternon"
    t.boolean  "martes"
    t.time     "open_martes_morning"
    t.time     "close_martes_morning"
    t.time     "open_martes_afternon"
    t.time     "close_martes_afternon"
    t.boolean  "miercoles"
    t.time     "open_miercoles_morning"
    t.time     "close_miercoles_morning"
    t.time     "open_miercoles_afternon"
    t.time     "close_miercoles_afternon"
    t.boolean  "jueves"
    t.time     "open_jueves_morning"
    t.time     "close_jueves_morning"
    t.time     "open_jueves_afternon"
    t.time     "close_jueves_afternon"
    t.boolean  "viernes"
    t.time     "open_viernes_morning"
    t.time     "close_viernes_morning"
    t.time     "open_viernes_afternon"
    t.time     "close_viernes_afternon"
    t.boolean  "sabado"
    t.time     "open_sabado_morning"
    t.time     "close_sabado_morning"
    t.time     "open_sabado_afternon"
    t.time     "close_sabado_afternon"
    t.boolean  "domingo"
    t.time     "open_domingo_morning"
    t.time     "close_domingo_morning"
    t.time     "open_domingo_afternon"
    t.time     "close_domingo_afternon"
    t.integer  "user_id"
    t.string   "direccion"
    t.float    "longitud"
    t.float    "latitud"
    t.string   "telefono"
    t.string   "telefono_sec"
    t.string   "website"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "email"
    t.boolean  "active"
    t.datetime "expires_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "bussines", ["user_id"], name: "index_bussines_on_user_id"

  create_table "tokens", force: :cascade do |t|
    t.datetime "expires_at"
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "nivel",      default: 0
    t.string   "avatar"
  end

end
