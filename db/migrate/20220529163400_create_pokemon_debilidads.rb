class CreatePokemonDebilidads < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_debilidads, id: false do |t|
      t.integer :pokemon_id
      t.integer :tipo_id
    end
    add_index :pokemon_debilidads, :pokemon_id
    add_index :pokemon_debilidads, :tipo_id
  end
end
