module UsersHelper
  def get_parent_name user
    return if not user.parent
    user.parent.real_name
  end

  def get_disable_class_name_if_necessary
    current_user.roles_name.include?(Role::ROLES[:operator]) ? "" : "disable"
  end

  def is_operator_role
    return current_user.roles_name.include?(Role::ROLES[:operator]) ? true : false
  end

end
