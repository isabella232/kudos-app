class KudoersController < ApplicationController

  def show
    @kudoer = Kudoer.find(params[:id])
  end

  def new
    @kudoer = Kudoer.new
  end

  def create
    @kudoer = Kudoer.new(kudoer_params)    # Not the final implementation!
    if @kudoer.save
      sign_in @kudoer
      flash[:success] = "Welcome to the Kudos!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def kudoer_params
    params.require(:kudoer).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
