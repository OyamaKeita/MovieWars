class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #binding.pry
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録完了'
    else
      flash.now[:danger] = '登録失敗'
      render :new
  end
end

def show
  @user = User.find(session[:user_id])
end

def edit
  @user = User.find(session[:user_id])
end

def update
   @user = User.find(params[:id])
   if @user.update_attributes(user_params)

     redirect_to @user, success: '更新完了'
   else
     flash.now[:danger] = '更新失敗'
     render :edit
   end
 end


private
def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :sex)
end
end
