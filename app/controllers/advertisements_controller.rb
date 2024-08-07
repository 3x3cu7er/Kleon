class AdvertisementsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_advertisement, only: [:show, :edit, :update, :destroy]

  def index
    @advertisements = Advertisement.all
  end

  def show
  end

  def new
    @advertisement = current_user.advertisements.build
  end

  def create
    @advertisement = current_user.advertisements.build(advertisement_params)
    if @advertisement.save
      redirect_to @advertisement, notice: 'Advertisement was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @advertisement.update(advertisement_params)
      redirect_to @advertisement, notice: 'Advertisement was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @advertisement.destroy
    redirect_to advertisements_url, notice: 'Advertisement was successfully destroyed.'
  end

  private

  def set_advertisement
    @advertisement = Advertisement.find(params[:id])
  end

  def advertisement_params
    params.require(:advertisement).permit(:title, :body)
  end
end
