class UsersController < ApplicationController
  def index
  end

  def register
    @user = User.new
    @user.full_name = params[:full_name]
    @user.user_name = params[:user_name]
    @user.password = params[:password]
    @user.address = params[:address]
    @user.city = params[:city]
    @user.zip = params[:zip]
    @user.country = params[:country]
    @user.email = params[:email]

    if User.exists?(user_name: @user.user_name)
      cookies[:exists] = 'User name already exists.'
      redirect_to '/users/login'
    else
      if @user.save
        add_phone(params[:home_phone])
        add_phone(params[:work_phone])
        add_phone(params[:cell_phone])
        cookies[:user_id] = @user.id
        cookies[:exists] = 'Thank you for registering.'
        redirect_to '/users/login'
      else
        render plain: 'Could not save user'
      end
    end
  end

  def add_phone number
    unless number.strip.empty?
      @phone = Phone.new
      @phone.number = number
      @user.phones << @phone
      @phone.save
    end
  end

  def login_submit
    a_user = User.find_by(user_name: params[:user_name]).user_name
    password = User.find_by(user_name: a_user).password

    if a_user && password == params[:password]
      cookies[:full_name] = User.find_by(user_name: a_user).full_name
      redirect_to '/users/dashboard'
    else
      cookies[:exists] = 'Log in unsuccessful. Try again.'
      render '/users/login'
    end
  end

  def dashboard
  end

end
