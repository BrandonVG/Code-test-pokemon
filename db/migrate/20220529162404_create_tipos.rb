class CreateTipos < ActiveRecord::Migration[7.0]
  def change
    create_table :tipos do |t|
      t.string :tipo

      t.timestamps
    end
    add_index :tipos, :tipo, unique: true
  end
end
