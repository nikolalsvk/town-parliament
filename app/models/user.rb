class User < ActiveRecord::Base
  # will citizen role be a default one?
  #   how will we add other roles to users?
  #   Should admin add those roles?
  after_create :add_citizen_role

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable

  has_and_belongs_to_many :roles

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

  # ADMIN

  def make_admin
    self.roles << Role.admin
  end

  def revoke_admin
    self.roles.delete(Role.admin)
  end

  def admin?
    role?(:admin)
  end

  # CITIZEN

  def make_citizen
    self.roles << Role.citizen
  end

  def revoke_citizen
    self.roles.delete(Role.citizen)
  end

  def citizen?
    role?(:citizen)
  end

  # ALDERMAN

  def make_alderman
    make_citizen
    self.roles << Role.alderman
  end

  def revoke_alderman
    self.roles.delete(Role.alderman)
  end

  def alderman?
    role?(:alderman)
  end

  # ASSEMBLY PRESIDENT

  def make_assembly_president
    make_alderman
    self.roles << Role.assembly_president
  end

  def revoke_assembly_president
    self.roles.delete(Role.assembly_president)
  end

  def assembly_president?
    role?(:assembly_president)
  end

  # FACEBOOK STUFF

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['info']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password.
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end

  private

  def add_citizen_role
    make_citizen    
  end

end
