class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :icra
      t.string :name
      t.text :description
      t.boolean :general_aviation_hull
      t.boolean :general_aviation_liabillity

      t.timestamps
    end
  end
end
