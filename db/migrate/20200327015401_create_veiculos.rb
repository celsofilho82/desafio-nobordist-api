class CreateVeiculos < ActiveRecord::Migration[5.2]
  def change
    create_table :veiculos do |t|
      t.string :marca
      t.string :veiculo
      t.integer :ano
      t.text :descricao
      t.string :vendido
      t.string :boolean

      t.timestamps
    end
  end
end
