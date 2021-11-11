module ApplicationHelper
  def current_user
    User.find(cookies.encrypted[:user_id])
  end
end
