class CreateTradingNames < ActiveRecord::Migration[6.0]
  def change
    create_table :trading_names do |t|
      t.string :name
      t.references :coverholder

      t.timestamps
    end
  end
end
