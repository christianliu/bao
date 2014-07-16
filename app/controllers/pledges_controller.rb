class PledgesController < ApplicationController
  def new
  	@pledge = Pledge.new
  end

  def create
  	@pledge = Pledge.create(pledge_params)
  end

  private
  def pledge_params
  	params.require(:pledge).permit(:about, :user_id)
  end
end
