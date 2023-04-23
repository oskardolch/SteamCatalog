class QualitiesController < ApplicationController
  def index
    @qualities = Quality.all
  end

  def show
    @quality = Quality.find(params[:id])
  end

  def new
    @quality = Quality.new
  end

  def create
    @quality = Quality.new(quality_params)

    if @quality.save
      redirect_to qualities_path
    else
      @quality.errors.full_messages.each do |message|
        flash[:danger] = message
      end
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @quality = Quality.find(params[:id])
  end

  def update
    @quality = Quality.find(params[:id])

    if @quality.update(quality_params)
      redirect_to qualities_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quality = Quality.find(params[:id])
    @quality.destroy

    redirect_to qualities_path, status: :see_other
  end

  private
    def quality_params
      params.require(:quality).permit(:name, :desc)
    end
end
