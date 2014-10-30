class Wiki < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to  :user
  has_many    :collaborations
  has_many    :contributors, :through => :collaborations, source: :user

  validates_presence_of :name, :slug, :body
  validates_uniqueness_of :name, :case_sensitive => false

  def should_generate_new_friendly_id?
    new_record?
  end

end
