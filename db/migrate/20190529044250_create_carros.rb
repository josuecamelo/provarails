class CreateCarros < ActiveRecord::Migration[5.1]
  def change
    create_table :carros do |t|
 	  t.string :marca
      t.string :modelo
      t.boolean :disponivel
      t.timestamps
    end

    create_table :reservas do |t|
      t.integer :carro_id
      t.string :responsavel
      t.timestamps
    end
  end
end
