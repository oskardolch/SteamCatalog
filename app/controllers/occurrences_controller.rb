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

  def new_with_template
    @occurrence = Occurrence.new
    @occurrence.user = $current_user
    unless $serach_params['engine_id'] == ''
      @occurrence.engine_id = $serach_params['engine_id'].to_i
    end
    @occurrence.series = $serach_params['series']
    @occurrence.name = $serach_params['name']
    unless $serach_params['literature_id'] == ''
      @occurrence.literature_id = $serach_params['literature_id'].to_i
    end
    @occurrence.volume = $serach_params['volume']
    @occurrence.number = $serach_params['number']
    @occurrence.year = $serach_params['year']
    @occurrence.page = $serach_params['page']
    unless $serach_params['view_id'] == ''
      @occurrence.view_id = $serach_params['view_id'].to_i
    end
    unless $serach_params['quality_id'] == ''
      @occurrence.quality_id = $serach_params['quality_id'].to_i
    end
    @occurrence.location = $serach_params['location']
    unless $serach_params['tender'] == ''
      @occurrence.tender = $serach_params['tender'].to_i
    end
    @occurrence.tender_series = $serach_params['tender_series']
    unless $serach_params['detail'] == ''
      @occurrence.detail = $serach_params['detail'].to_i
    end
    unless $serach_params['operator_id'] == ''
      @occurrence.operator_id = $serach_params['operator_id'].to_i
    end
    unless $serach_params['maker_id'] == ''
      @occurrence.maker_id = $serach_params['maker_id'].to_i
    end
    @occurrence.private = $serach_params['private'] == '1'
    render :new
  end

  def create
    @occurrence = Occurrence.new(occurrence_params)
    @occurrence.user = $current_user

    if @occurrence.save
      redirect_to root_path
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
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @occurrence = Occurrence.find(params[:id])
    @occurrence.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def occurrence_params
      params.require(:occurrence).permit(:engine_id, :series, :name, :literature_id, :volume, :number, :year, :page, :view_id, :quality_id, :date, :location, :tender, :tender_series, :detail, :user_id, :operator_id, :maker_id, :private, :note)
    end
end
