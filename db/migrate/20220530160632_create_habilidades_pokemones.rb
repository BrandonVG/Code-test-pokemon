class CreateHabilidadesPokemones < ActiveRecord::Migration[7.0]
  def change
    create_table :habilidades_pokemones do |t|
      t.integer :pokemon_id
      t.integer :habilidad_id
    end
    add_index :habilidades_pokemones, :pokemon_id
    add_index :habilidades_pokemones, :habilidad_id
  end
end
