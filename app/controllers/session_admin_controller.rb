class SessionAdminController < ApplicationController
	skip_before_action :admin_authorize

  def new
  end

  def create
  	user = User.find_by(name: params[:name])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to admin_url
  	else
  		redirect_to login_url, alert: "неверная комбинация имени и пароля"
 		end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, notice: "Сеанс работы завершен"
  end
end
