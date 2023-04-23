class AccessoriesController < ApplicationController
  def index
    @accessories = Accessory.all
  end

  def show
    @accessory = Accessory.find(params[:id])
  end

  def new
    @accessory = Accessory.new
  end

  def create
    @accessory = Accessory.new(accessory_params)

    if @accessory.save
      redirect_to accessories_path
    else
      @accessory.errors.full_messages.each do |message|
        flash[:danger] = message
      end
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @accessory = Accessory.find(params[:id])
  end

  def update
    @accessory = Accessory.find(params[:id])

    if @accessory.update(accessory_params)
      redirect_to accessories_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @accessory = Accessory.find(params[:id])
    @accessory.destroy

    redirect_to accessories_path, status: :see_other
  end

  private
    def accessory_params
      params.require(:accessory).permit(:name, :maker_id)
    end
end
