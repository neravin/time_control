class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :destroy]

	def index
		@users = User.order(:name)
	end

	def new
		@user = User.new
	end

	def edit
	end

	def create
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				format.html { redirect_to users_url,
					notice: "Пользователь #{@user.name} был успешно создан." }
				format.json { render action: 'show',
					status: :created, location: @user }
			else
				format.html { render action: 'new' }
				format.json { render json: @user.errors,
					status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to users_url,
					notice: "Сведения о пользователе #{@user.name} были успешно обновлены." }
					format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @user.errors,
					status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@user.destroy
		respond_to do |format|
			format.html { redirect_to users_url }
		end
	end

	private
  	def set_user
  		@user = User.find(params[:id])
  	end

  	#while list
  	def user_params
  		params.require(:user).permit(
  			:name, 
  			:password, 
  			:password_confirmation)
  	end
end