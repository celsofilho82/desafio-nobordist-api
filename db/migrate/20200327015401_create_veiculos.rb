class CreateVeiculos < ActiveRecord::Migration[5.2]
  def change
    create_table :veiculos do |t|
      t.string :marca
      t.string :modelo
      t.integer :ano
      t.text :descricao
      t.boolean :vendido

      t.timestamps
    end
  end
end
