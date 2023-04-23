class ViewsController < ApplicationController
  def index
    @views = View.all
  end

  def show
    @view = View.find(params[:id])
  end

  def new
    @view = View.new
  end

  def create
    @view = View.new(view_params)

    if @view.save
      redirect_to views_path
    else
      @view.errors.full_messages.each do |message|
        flash[:danger] = message
      end
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @view = View.find(params[:id])
  end

  def update
    @view = View.find(params[:id])

    if @view.update(view_params)
      redirect_to views_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @view = View.find(params[:id])
    @view.destroy

    redirect_to views_path, status: :see_other
  end

  private
    def view_params
      params.require(:view).permit(:name, :desc)
    end
end
