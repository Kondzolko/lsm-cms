class CreateTradingLocationAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :trading_location_addresses do |t|
      t.references :coverholder
      t.string :country
      t.string :state
      t.string :city
      t.string :zip
      t.string :phone
      t.string :address_line_1
      t.string :address_line_2

      t.timestamps
    end
  end
end
