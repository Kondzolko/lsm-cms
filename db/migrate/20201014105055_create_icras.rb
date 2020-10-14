class CreateIcras < ActiveRecord::Migration[6.0]
  def change
    create_table :icras do |t|
      t.references :deal
      t.boolean :general_aviation_hull
      t.boolean :general_aviation_liabillity
      t.boolean :baa

      t.timestamps
    end
  end
end
