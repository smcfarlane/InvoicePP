module ApplicationHelper
  def user_type(user)
    roles = Role.where(user_id: user.id)
    a = []
    roles.each do |role|
      klass = "#{role.role}".constantize
      a << klass.find(role.ref_id)
    end
    return a
  end
end
