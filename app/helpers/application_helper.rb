module ApplicationHelper

  def user_profile
    if current_user.first_name.blank? && current_user.last_name.blank?
      return 'User profile'
    else
      return "#{current_user.first_name} #{current_user.last_name}"
    end
  end

end
