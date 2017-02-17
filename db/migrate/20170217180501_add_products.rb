class AddProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|

    t.column :name, :string
    t.column :description, :string
    t.column :price, :float

    t.timestamps
  end
  end
end
