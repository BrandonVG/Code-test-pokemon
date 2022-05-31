class CreatePokemones < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemones do |t|
      t.string :nombre
      t.integer :numero
      t.string :altura
      t.string :peso
      t.string :imagen

    end
    add_index :pokemones, :nombre, unique: true
    add_index :pokemones, :numero, unique: true
  end
end
