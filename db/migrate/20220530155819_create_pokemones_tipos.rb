class CreatePokemonesTipos < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemones_tipos do |t|
      t.integer :pokemon_id
      t.integer :tipo_id
    end
    add_index :pokemones_tipos, :pokemon_id
    add_index :pokemones_tipos, :tipo_id
  end
end
