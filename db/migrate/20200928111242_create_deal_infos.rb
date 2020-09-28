class CreateDealInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :deal_infos do |t|
      t.references :deal
      t.integer :lsm_platform_type
      t.boolean :has_davies_group_letter
      t.boolean :has_binding_authority_agreement_broker_name
      t.string :broker_contact_name
      t.string :broker_existing_binder_portfolio
      t.string :lsm_new_products
      t.text :ownership_details

      t.timestamps
    end
  end
end
