class AddBarberToUser < ActiveRecord::Migration
  def change
    add_column :users, :barber, :boolean, default: false
  end
end
