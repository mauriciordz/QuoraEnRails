class UsersController < ApplicationController
  
  def index
  end

  def new
   p @user = User.new
  end

  def create
    p user_name = params[:user][:user_name]
    p mail = params[:user][:mail]
    p password = params[:user][:password]

    

    if logged_in?
      user = User.find_by(user_name: user_name)
      user.update(user_name: user_name, mail: mail, password: password)
      flash[:edit_message] = "Tus datos fueron editados"
      render 'index'

    else
      @user = User.new(user_name: user_name, mail: mail, password: password)
      if @user.save
        flash[:create_message] = "Tus datos fueron editados"
        render 'index'
      else
        render 'new'
      end
    end


  end

  def login
  end

  def access
    @user_mail = params[:mail]
     p @user_mail
    @user_pass = params[:password].pop
     p @user_pass
    val_user = User.authenticate(@user_mail, @user_pass)
    p val_user
    # p @val_user
    if val_user
      session[:id] = val_user.id
      session[:password] = val_user.password
      session[:email] = val_user.mail
      session[:user_name] = val_user.user_name
      render 'index' 
    else
      flash[:error_message] = "No son correctos tus datos"
      render 'index'
    end
  end

  def logout
    session.clear
    render 'index'
  end


  
end
