class UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      @user.errors.full_messages.each do |message|
        flash[:danger] = message
      end
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
puts 'Dobry 3'
p user_edit_params
puts 'Dobry 4'
    @user = User.find(params[:id])
    if @user.update(user_edit_params)
      redirect_to root_path
    else
#      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, status: :see_other
  end

private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :fullname, :admin, :note, :prefer_private, :pref_lang)
  end

  def user_edit_params
    if params['user']['password'].nil? || params['user']['password_confirmation'].nil?
      params.require(:user).permit(:name, :fullname, :admin, :note, :prefer_private, :pref_lang)
    elsif params['user']['password'].empty? && params['user']['password_confirmation'].empty?
      params['user'].delete('password')
      params['user'].delete('password_confirmation')
      params.require(:user).permit(:name, :fullname, :admin, :note, :prefer_private, :pref_lang)
    else
      params.require(:user).permit(:name, :password, :password_confirmation, :fullname, :admin, :note, :prefer_private, :pref_lang)
    end
  end

  def require_admin
    unless $current_user.admin
      flash[:danger] = t('app.admin_required')
      redirect_to root_url
    end
  end
end
