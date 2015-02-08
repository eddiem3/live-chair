class CreateProfileSkillList < ActiveRecord::Migration
  def change
      create_table :profiles_skill_lists, id: false do |t|
      t.belongs_to :profile, index: true
      t.belongs_to :skill_list, index: true
    end
  end
end
