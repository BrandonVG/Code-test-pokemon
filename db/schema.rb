# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_30_160632) do
  create_table "habilidades", force: :cascade do |t|
    t.string "habilidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["habilidad"], name: "index_habilidades_on_habilidad", unique: true
  end

  create_table "habilidades_pokemones", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "habilidad_id"
    t.index ["habilidad_id"], name: "index_habilidades_pokemones_on_habilidad_id"
    t.index ["pokemon_id"], name: "index_habilidades_pokemones_on_pokemon_id"
  end

  create_table "pokemon_debilidads", id: false, force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "tipo_id"
    t.index ["pokemon_id"], name: "index_pokemon_debilidads_on_pokemon_id"
    t.index ["tipo_id"], name: "index_pokemon_debilidads_on_tipo_id"
  end

  create_table "pokemones", force: :cascade do |t|
    t.string "nombre"
    t.integer "numero"
    t.string "altura"
    t.string "peso"
    t.string "imagen"
    t.index ["nombre"], name: "index_pokemones_on_nombre", unique: true
    t.index ["numero"], name: "index_pokemones_on_numero", unique: true
  end

  create_table "pokemones_tipos", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "tipo_id"
    t.index ["pokemon_id"], name: "index_pokemones_tipos_on_pokemon_id"
    t.index ["tipo_id"], name: "index_pokemones_tipos_on_tipo_id"
  end

  create_table "tipos", force: :cascade do |t|
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tipo"], name: "index_tipos_on_tipo", unique: true
  end

end
