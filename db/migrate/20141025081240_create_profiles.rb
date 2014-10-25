class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :shop_name
      t.string :phone
      t.text :address
      t.string :state
      t.string :city
      t.string :zip

      t.timestamps
    end
  end
end
