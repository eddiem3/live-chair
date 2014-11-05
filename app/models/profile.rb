class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :skill_lists
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def average_rating
    Review.where(:profile_id => self.id).average(:rating)
  end
  
end
