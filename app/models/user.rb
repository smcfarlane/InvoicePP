class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :roles

  def has_role?(*roles)
    r = Role.select("role").where(user_id: id).map {|x| x.role.to_s}
    n = false
    roles.each do |x|
      n = true if r.include? x
    end
    return n
  end

  def client?
    check_role("Client")
  end

  def manager?
    check_role("Manager")
  end

  def vendor?
    check_role("Vendor")
  end

  private

  def check_role(role_str)
    r = Role.where(user_id: id)
    r.each do |x|
      if x.role == role_str
        return true
      else
        return false
      end
    end
  end
end
