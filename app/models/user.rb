class User < ActiveRecord::Base	
		extend FriendlyId
	friendly_id :name, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_and_belongs_to_many :roles
  before_validation :make_first_user_admin!
  
  def role?(role)
	   return !!self.roles.find_by_name(role.to_s)
  end

  def make_first_user_admin!
    if User.count == 0
      admin_role = Role.find_by_name("super_admin")
      self.roles << admin_role
    else
      self.roles << Role.find_by_name("guest")
    end
  end
end

