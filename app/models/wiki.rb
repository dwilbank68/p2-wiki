# == Schema Information
#
# Table name: wikis
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  body       :text
#  private    :boolean          default(FALSE)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#

class Wiki < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  #friendly_id :name, :use => :history

  belongs_to  :user
  has_many    :collaborations
  has_many    :contributors, :through => :collaborations, source: :user

  validates_presence_of :name, :slug, :body
  validates_uniqueness_of :name, :case_sensitive => false

  default_scope { order(:name) }
  scope :visible, ->  { where( private: false ) }
  scope :hidden, -> { where( private: true  ) }

  def should_generate_new_friendly_id?
    name_changed?
  end



end
