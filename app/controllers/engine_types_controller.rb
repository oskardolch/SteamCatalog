class EngineTypesController < ApplicationController
  def index
    @engine_types = EngineType.all
  end

  def show
    @engine_type = EngineType.find(params[:id])
  end

  def new
    @engine_type = EngineType.new
  end

  def create
    @engine_type = EngineType.new(engine_type_params)

    if @engine_type.save
      redirect_to engine_types_path
    else
      @engine_type.errors.full_messages.each do |message|
        flash[:danger] = message
      end
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @engine_type = EngineType.find(params[:id])
  end

  def update
    @engine_type = EngineType.find(params[:id])

    if @engine_type.update(engine_type_params)
      redirect_to engine_types_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @engine_type = EngineType.find(params[:id])
    @engine_type.destroy

    redirect_to engine_types_path, status: :see_other
  end

  private
    def engine_type_params
      params.require(:engine_type).permit(:name, :desc)
    end
end
