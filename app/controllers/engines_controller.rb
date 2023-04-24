class EnginesController < ApplicationController
  $engines_engine_type_filter = nil
  $engines_operator_filter = nil

  def index
    sql_where = ''
    if $engines_engine_type_filter.nil?
      unless $engines_operator_filter.nil?
        sql_where = "operator_id = #{$engines_operator_filter}"
      end
    else
      sql_where = "engine_type_id = #{$engines_engine_type_filter}"
      unless $engines_operator_filter.nil?
        sql_where += " and operator_id = #{$engines_operator_filter}"
      end
    end
    if sql_where == ''
      @engines = Engine.order(:class_no)
    else
      @engines = Engine.where(sql_where).order(:class_no)
    end
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

  def filter_type
    if params['id'] == ''
      $engines_engine_type_filter = nil
    else
      $engines_engine_type_filter = params['id'].to_i
    end
  end

  def filter_operator
    if params['id'] == ''
      $engines_operator_filter = nil
    else
      $engines_operator_filter = params['id'].to_i
    end
  end

  private
    def engine_params
      params.require(:engine).permit(:class_no, :name, :operator_id, :engine_type_id, :alternate_for)
    end
end
