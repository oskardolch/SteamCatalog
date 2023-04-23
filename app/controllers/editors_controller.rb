class EditorsController < ApplicationController
  def index
    @editors = Editor.all
  end

  def show
    @editor = Editor.find(params[:id])
  end

  def new
    @editor = Editor.new
  end

  def create
    @editor = Editor.new(editor_params)

    if @editor.save
      redirect_to editors_path
    else
      @editor.errors.full_messages.each do |message|
        flash[:danger] = message
      end
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @editor = Editor.find(params[:id])
  end

  def update
    @editor = Editor.find(params[:id])

    if @editor.update(editor_params)
      redirect_to editors_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @editor = Editor.find(params[:id])
    @editor.destroy

    redirect_to editors_path, status: :see_other
  end

  private
    def editor_params
      params.require(:editor).permit(:name, :desc, :note)
    end
end
