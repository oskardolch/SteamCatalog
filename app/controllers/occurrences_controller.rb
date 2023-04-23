class OccurrencesController < ApplicationController
  def index
    @occurrences = Occurrence.all
  end

  def show
    @occurrence = Occurrence.find(params[:id])
  end

  def new
    @occurrence = Occurrence.new
    @occurrence.user = $current_user
    @occurrence.private = $current_user.prefer_private
  end

  def create
    @occurrence = Occurrence.new(occurrence_params)
    @occurrence.user = $current_user

    if @occurrence.save
      redirect_to occurrences_path
    else
      @occurrence.errors.full_messages.each do |message|
        flash[:danger] = message
      end
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @occurrence = Occurrence.find(params[:id])
  end

  def update
    @occurrence = Occurrence.find(params[:id])

    if @occurrence.update(occurrence_params)
      redirect_to occurrences_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @occurrence = Occurrence.find(params[:id])
    @occurrence.destroy

    redirect_to occurrences_path, status: :see_other
  end

  private
    def occurrence_params
      params.require(:occurrence).permit(:engine_id, :series, :name, :literature_id, :volume, :number, :year, :page, :view_id, :quality_id, :date, :location, :tender, :tender_series, :detail, :user_id, :operator_id, :maker_id, :private, :note)
    end
end
