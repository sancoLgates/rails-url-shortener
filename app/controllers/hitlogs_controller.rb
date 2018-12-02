class HitlogsController < ApplicationController
  def create
    @shorten = shorten.find(params[:id])
    @hitlog = @shorten.hitlogs.create(hitlog_params)
    redirect_to shorten_path(@shorten)
  end
 
  private
    def hitlog_params
      params.require(:hitlog).permit(:ip, :city, :country)
    end
end
