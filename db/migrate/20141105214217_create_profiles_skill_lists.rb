class CreateProfilesSkillLists < ActiveRecord::Migration
  def change
    create_table :profiles_skill_lists do |t|
      t.belongs_to :profile, index: true
      t.belongs_to :skill_list, index: true

      t.timestamps
    end
  end
end
