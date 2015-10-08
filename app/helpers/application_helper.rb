module ApplicationHelper
  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

  # def is_admin?
  #   current_user.user_role == 1
  # end
end
