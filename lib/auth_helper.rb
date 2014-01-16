module AuthHelper
  def basic_auth
    authenticate_or_request_with_http_basic do |user, password|
      user === "admin" && password === "adminislider"
    end
  end

  #Admin auth
  def admin_sign_in(admin)
    session[:admin_id] = admin.id
  end

  def admin_signed_in?
    session[:admin_id] && Admin.find_by_id(session[:admin_id])
  end

  def admin_sign_out
    session[:admin_id] = nil
  end

  def authenticate_admin?(admin, password)
    admin.password === password
  end

  def authenticate_admin!
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end

  def check_access_to_edit?(instance)
    admin_signed_in? || (user_signed_in? && instance.user_id == current_user.id)
  end
end
