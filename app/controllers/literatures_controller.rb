class LiteraturesController < ApplicationController
  def index
    @literatures = Literature.all
  end

  def show
    @literature = Literature.find(params[:id])
  end

  def new
    @literature = Literature.new
  end

  def create
    @literature = Literature.new(literature_params)

    if @literature.save
      redirect_to literatures_path
    else
      @literature.errors.full_messages.each do |message|
        flash[:danger] = message
      end
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @literature = Literature.find(params[:id])
  end

  def update
    @literature = Literature.find(params[:id])

    if @literature.update(literature_params)
      redirect_to literatures_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @literature = Literature.find(params[:id])
    @literature.destroy

    redirect_to literatures_path, status: :see_other
  end

  private
    def literature_params
      params.require(:literature).permit(:title, :year, :editor_id)
    end
end
