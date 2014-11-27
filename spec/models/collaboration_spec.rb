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

require 'rails_helper'

RSpec.describe Collaboration, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
