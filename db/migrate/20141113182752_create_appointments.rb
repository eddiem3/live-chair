class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.belongs_to :user, index: true
      t.string :date
      t.string :time

      t.timestamps
    end
  end
end
