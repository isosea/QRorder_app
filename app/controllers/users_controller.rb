class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "QR Orderへようこそ！"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def show
    @history_items = HistoryItem.all
    @tables = Table.all
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
