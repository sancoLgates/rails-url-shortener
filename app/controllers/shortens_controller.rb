class ShortensController < ApplicationController
  before_action :set_shorten, only: [:show, :edit, :update, :destroy]

  def index
    @shortens = Shorten.order(count: :DESC).limit(10)
  end

  def show
  end

  def s
    @shorten = Shorten.find_by(short_url: params[:name])
    if @shorten
        
        @shorten.update_columns(count: @shorten.count+1)
        
        @ip = request.ip
        @city = (request.location.city) ? request.location.city : 'unknown'
        @country = (request.location.country) ? request.location.country : 'unknown'
        
        @hitlog = @shorten.hitlogs.create(:ip => @ip, :city => @city, :country => @country)

        @notice = @shorten.real_url
        redirect_to @shorten.real_url
    else
        @notice = "Sorry, Url Not Found!"
    end
  end


  def new
    @shorten = Shorten.new
  end

  def edit
  end

  def create
    @shorten = Shorten.new(shorten_params)

    respond_to do |format|
      if @shorten.save
        format.html { redirect_to @shorten, notice: 'Shorten was successfully created.' }
        format.json { render :show, status: :created, location: @shorten }
      else
        format.html { render :new }
        format.json { render json: @shorten.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shorten.update(shorten_params)
        format.html { redirect_to @shorten, notice: 'Shorten was successfully updated.' }
        format.json { render :show, status: :ok, location: @shorten }
      else
        format.html { render :edit }
        format.json { render json: @shorten.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shorten.destroy
    respond_to do |format|
      format.html { redirect_to shortens_url, notice: 'Shorten was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
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
