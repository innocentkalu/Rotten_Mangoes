class Admin::UsersController < ApplicationController

  before_action :admin_access

  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @user_reviews = Review.where(user_id:@user.id)
  end

  def new
    @user = User.new
  end  

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "User Successfully Created!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
        # Tell the UserMailer to send a goodbye email 
        UserMailer.goodbye_email(@user).deliver_now
      format.html { redirect_to(admin_users_path, notice: 'User was successfully deleted.') }
    end
  end

  def update
    puts "Hello Hello"
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :admin, :password, :password_confirmation)
  end

end
