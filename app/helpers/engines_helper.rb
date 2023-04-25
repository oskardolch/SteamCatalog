module EnginesHelper
  def engines_list
    nothing = ""
    sql_where = ''
    if $serach_params['engine_type_filter_id'] == ''
      unless $serach_params['engine_operator_filter_id'] == ''
        sql_where = "operator_id = #{$serach_params['engine_operator_filter_id'].to_i}"
      end
    else
      sql_where = "engine_type_id = #{$serach_params['engine_type_filter_id'].to_i}"
      unless $serach_params['engine_operator_filter_id'] == ''
        sql_where += " and operator_id = #{$serach_params['engine_operator_filter_id'].to_i}"
      end
    end
    if sql_where == ''
      Engine.order(:class_no).collect{|m| ["#{m.class_no} - #{m.operator ? m.operator.name : nothing}", m.id]}
    else
      Engine.where(sql_where).order(:class_no).collect{|m| ["#{m.class_no} - #{m.operator ? m.operator.name : nothing}", m.id]}
    end
  end

  def tenders_list
    tender_type_id = EngineType.where("LOWER(name) = '#{t('occurrence.tender').downcase}'").first.id
    nothing = ""
    Engine.where("engine_type_id = #{tender_type_id}").order(:class_no).collect{|m| ["#{m.class_no} - #{m.operator ? m.operator.name : nothing}", m.id]}
  end
end
