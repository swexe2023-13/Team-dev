class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
    uid: params[:user][:uid],
    password: params[:user][:password])
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
  
  def edit
      @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
      if @user.update(
    uid: params[:user][:uid],
    password: params[:user][:password])
        flash[:notice] = '1レコード更新しました'
        redirect_to users_path
      else
        render 'edit'
      end
  end
end