class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis # that he created
  has_many :collaborations
  has_many :wiki_contributions, :through => :collaborations, :source => :wiki

  def admin?
    role == 'admin'          # which is really self.role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end


end

# user.wikis
# user.wiki_contributions
# wiki.user
# wiki.users