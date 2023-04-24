class MakersController < ApplicationController
  def index
    @makers = Maker.order(:name)
  end

  def show
    @maker = Maker.find(params[:id])
  end

  def new
    @maker = Maker.new
  end

  def create
    @maker = Maker.new(maker_params)

    if @maker.save
      redirect_to makers_path
    else
      @maker.errors.full_messages.each do |message|
        flash[:danger] = message
      end
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @maker = Maker.find(params[:id])
  end

  def update
    @maker = Maker.find(params[:id])

    if @maker.update(maker_params)
      redirect_to makers_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @maker = Maker.find(params[:id])
    @maker.destroy

    redirect_to makers_path, status: :see_other
  end

  private
    def maker_params
      params.require(:maker).permit(:name, :desc, :location, :note)
    end
end
