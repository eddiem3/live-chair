class AddIndexToReviews < ActiveRecord::Migration
  def self.up
  	add_index :reviews, :profile_id
  end

  def self.down
  	remove_index :reviews, :profile_id
  end
end
