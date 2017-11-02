class Auth::UsersController < Auth::BaseController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    puts @user
    @user = User.new(user_params)
    if @user.save
      UserMailer.register_email(@user).deliver_now
      redirect_to root_path
    else
      render :new
    end
  end

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
