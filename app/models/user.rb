# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  role                   :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  subscribed             :boolean          default(FALSE)
#  stripeid               :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  account_expiration     :datetime
#  account_activation     :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis # that he created
  has_many :collaborations
  has_many :wiki_contributions, :through => :collaborations, :source => :wiki

  validates :name, :presence => true, :uniqueness => true

  scope :all_except, ->(user) { where.not(id:user) }

  def admin?
    role == 'admin'          # which is really self.role == 'admin'
  end


  def moderator?
    role == 'moderator'
  end

  def subscribed?
    subscribed
  end

  def collab_on?(wiki)
    wiki.collaborations.where(user_id:self.id).any?
  end

end

# user.wikis
# user.wiki_contributions
# wiki.user
# wiki.users
