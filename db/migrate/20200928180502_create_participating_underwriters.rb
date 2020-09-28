class CreateParticipatingUnderwriters < ActiveRecord::Migration[6.0]
  def change
    create_table :participating_underwriters do |t|
      t.references :underwriter
      t.references :deal

      t.timestamps
    end
  end
end
