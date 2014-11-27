# == Schema Information
#
# Table name: collaborations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  wiki_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Collaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki
end
