class KudoersController < ApplicationController

  def show
    @kudoer = Kudoer.find(params[:id])
  end

  def new
  end
end
