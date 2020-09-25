class CreateCoverholders < ActiveRecord::Migration[6.0]
  def change
    create_table :coverholders do |t|
      t.string :legal_entity_name, uniq: true

      t.timestamps
    end
  end
end
