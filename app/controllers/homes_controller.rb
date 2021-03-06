class HomesController < ApplicationController
  skip_before_action :require_login, only: %i[top terms privacy inquiry post]
  def top; end

  def mypage
    @bookmarks = current_user.bookmarks
  end

  def terms; end

  def privacy; end

  def inquiry
    @inquiry = Inquiry.new
  end

  def post
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      redirect_to root_path, success: '問い合わせが完了しました'
    else
      flash.now[:danger] = '問い合わせ内容に不備があります'
      render :inquiry
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:kind, :user_name, :user_email, :content)
  end
end
