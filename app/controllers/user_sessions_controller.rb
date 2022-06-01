class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to root_path, success: 'ログインしました'
    else
      flash.now[:danger] = 'メールアドレスもしくはパスワードに誤りがあります'
      render :new
    end
  end

  def destroy
    logout
    render :new
  end
end
