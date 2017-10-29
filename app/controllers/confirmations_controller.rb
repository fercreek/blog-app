class ConfirmationsController < ApplicationController
  def show
    
  end

  def create
    @user = User.where(confirmation_token: params[:token]).first
    @user.confirmed_at = DateTime.now
    if @user.save
      session[:user_id] = @user.id
    else
      # 
    end
  end
end