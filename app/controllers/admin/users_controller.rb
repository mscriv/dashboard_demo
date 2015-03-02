class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  @user = User.new
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        UserMailer.signup_confirmation(@user).deliver
        format.html { redirect_to admin_users_url, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: [:admin,@user] }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
