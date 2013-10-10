class SessionsController < ApplicationController

  def new
  end

  def create
    kudoer = Kudoer.find_by(email: params[:session][:email].downcase)
    if kudoer && kudoer.authenticate(params[:session][:password])
      sign_in kudoer
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
