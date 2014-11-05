class CreateSkillLists < ActiveRecord::Migration
  def change
    create_table :skill_lists do |t|
      t.string :skill

      t.timestamps
    end
  end
end
