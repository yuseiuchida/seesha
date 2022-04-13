class Admin::UsersController < Admin::BaseController
	before_action :set_user, only: %i[show edit update destroy]

	def index
		@users = User.all
	end

	def show; end

	def edit; end

	def update
		if @user.update(user_params)
			redirect_to admin_user_path(@user)
		else
			render :edit
		end
	end

	def destroy
		@user.destroy!
		redirect_to admin_users_path
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :role)
	end

	def set_user
		@user = User.find(params[:id])
	end
end