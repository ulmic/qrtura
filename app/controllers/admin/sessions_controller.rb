class Admin::SessionsController < ApplicationController
  def new
    if admin_signed_in?
      redirect_to admin_users_path
    else
      @admin = Admin.new
    end
  end

  def create
    @admin = Admin.find_by_login params[:admin][:login]
    if @admin && authenticate_admin?(@admin, params[:admin][:password])
      admin_sign_in @admin
      redirect_to admin_pages_path, flash: :success
    else
      @admin = Admin.new params[:admin]
      flash[:notice] = t('wrong_login')
      render action: :new
    end
  end

  def destroy
    admin_sign_out
    redirect_to :root, flash: :success
  end
end
