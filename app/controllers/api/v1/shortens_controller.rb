class Api::V1::ShortensController < ApiController
  before_action :set_shorten, only: [:show, :edit, :update, :destroy]

  def index
    @shortens = Shorten.all
    render json: @shortens
  end

  def create
    @shorten = Shorten.new(shorten_params)
      if @shorten.save
        @shorten.short_url = "#{request.base_url}/s/#{@shorten.short_url}"
        render json: @shorten, status: :created, location: @shorten
      else
        render json: @shorten.errors, status: :unprocessable_entity
      end
  end

  private
    def set_shorten
      @shorten = Shorten.find(params[:id])
    end

    def shorten_params
      params.require(:shorten).permit(:short_url, :real_url, :count)
    end
end
