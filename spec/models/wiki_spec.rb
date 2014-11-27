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

require 'rails_helper'

RSpec.describe Wiki, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
