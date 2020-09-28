class CreateDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :deals do |t|
      t.references :coverholder
      t.references :underwriter
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
