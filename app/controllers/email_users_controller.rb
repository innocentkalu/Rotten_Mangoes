class UsersController < ApplicationController
  before_action :set_email_user, only: [:show, :edit, :update, :destroy]

  # GET /email_users
  # GET /email_users.json
  def index
    @email_users = User.all
  end

  # GET /email_users/1
  # GET /email_users/1.json
  def show
  end

  # GET /email_users/new
  def new
    @email_user = User.new
  end

  # GET /email_users/1/edit
  def edit
  end

  # POST /email_users
  # POST /email_users.json
  # def create
  #   @user = User.new(email_user_params)

  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to @user, notice: 'Email user was successfully created.' }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @user = User.new(params[:email_user])
 
    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_email(@user).deliver_later
 
        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_users/1
  # PATCH/PUT /email_users/1.json
  def update
    respond_to do |format|
      if @email_user.update(email_user_params)
        format.html { redirect_to @email_user, notice: 'Email user was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_user }
      else
        format.html { render :edit }
        format.json { render json: @email_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_users/1
  # DELETE /email_users/1.json
  def destroy
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_user
      @email_user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_user_params
      params.require(:email_user).permit(:name, :email, :login)
    end
end
