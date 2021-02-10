# frozen_string_literal: true 
class UsersController < ApplicationController 
  
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
    @user = User.new
  end

  def create 
  @user = User.new(user_params) 
  respond_to do |format|
    if @user.save 
      format.html { redirect_to input_url } 
      format.json { render :show, status: :created, location: @user } 
      session[:user_id] = @user.id
    else
      format.html { render :new } 
      format.json { render json: @user.errors, status: :unprocessable_entity } 
      flash[:alert] = 'Пароли не совпадают'
    end 
  end 
end 
  
def index 
  @users = User.all
  respond_to do |format|
    format.html
    format.xml { render xml: @users.map { |cur| {login: cur.login, password: cur.password_digest } } } 
    format.json { render json: @users } 
  end
end 

def show; end 

def edit; end 

def update 
  respond_to do |format| 
    if @user.update(user_params) 
      format.html { redirect_to @user, notice: 'User was successfully updated.' } 
      format.json { render :show, status: :ok, location: @user } 
    else
      format.html { render :edit } 
      format.json { render json: @user.errors, status: :unprocessable_entity } 
    end 
  end 
end 

def destroy 
  @user = User.find(params[:id])
  @user.destroy
  respond_to do |format| 
  format.html { redirect_to users_url, notice: 'User was successfully destroyed.' } 
  format.json { head :no_content } 
  end
end 

def set_user 
  @user = User.find(params[:id]) 
end 

private

  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation)
  end
end