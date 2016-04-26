class UsersController < ApplicationController
  before_filter :authorize, only: [:edit, :update, :show]
  before_action :set_photoposts, only: [:show]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end


  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end


  def show
      @user = current_user
  end

  def update

  end

  private

  def set_photoposts
    @photoposts = current_user.photoposts
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
