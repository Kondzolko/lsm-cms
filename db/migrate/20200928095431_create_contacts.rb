class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.references :coverholder
      t.string :name
      t.string :email
      t.string :type

      t.timestamps
    end
  end
end
