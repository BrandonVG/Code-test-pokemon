class CreateHabilidades < ActiveRecord::Migration[7.0]
  def change
    create_table :habilidades do |t|
      t.string :habilidad

      t.timestamps
    end
    add_index :habilidades, :habilidad, unique: true
  end
end
