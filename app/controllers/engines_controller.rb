class EnginesController < ApplicationController
  def index
    @engines = Engine.all
  end

  def show
    @engine = Engine.find(params[:id])
  end

  def new
    @engine = Engine.new
  end

  def create
    @engine = Engine.new(engine_params)

    if @engine.save
      redirect_to engines_path
    else
      @engine.errors.full_messages.each do |message|
        flash[:danger] = message
      end
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @engine = Engine.find(params[:id])
  end

  def update
    @engine = Engine.find(params[:id])

    if @engine.update(engine_params)
      redirect_to engines_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @engine = Engine.find(params[:id])
    @engine.destroy

    redirect_to engines_path, status: :see_other
  end

  private
    def engine_params
      params.require(:engine).permit(:class_no, :name, :operator_id, :engine_type_id, :alternate_for)
    end
end
