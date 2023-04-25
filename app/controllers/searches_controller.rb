class SearchesController < ApplicationController
  skip_before_action :require_login

  $search_result = nil
  $serach_params = {
    'engine_type_filter_id'=>'',
    'engine_operator_filter_id'=>'',
    'engine_id'=>'',
    'series'=>'',
    'name'=>'',
    'literature_id'=>'',
    'volume'=>'',
    'number'=>'',
    'year'=>'',
    'page'=>'',
    'view_id'=>'',
    'quality_id'=>'',
    'location'=>'',
    'tender'=>'',
    'tender_series'=>'',
    'detail'=>'',
    'operator_id'=>'',
    'maker_id'=>'',
    'private'=>'',
    'synonyms'=>''
  }

  def show
    if $search_result.nil?
      $search_result = Occurrence.where('0=1')
    end
  end

  def clear
    $serach_params['engine_type_filter_id'] = ''
    $serach_params['engine_operator_filter_id'] = ''
    $serach_params['engine_id'] = ''
    $serach_params['series'] = ''
    $serach_params['name'] = ''
    $serach_params['literature_id'] = ''
    $serach_params['volume'] = ''
    $serach_params['number'] = ''
    $serach_params['year'] = ''
    $serach_params['page'] = ''
    $serach_params['view_id'] = ''
    $serach_params['quality_id'] = ''
    $serach_params['location'] = ''
    $serach_params['tender'] = ''
    $serach_params['tender_series'] = ''
    $serach_params['detail'] = ''
    $serach_params['operator_id'] = ''
    $serach_params['maker_id'] = ''
    $serach_params['private'] = ''
    $serach_params['synonyms'] = ''
    $search_result = Occurrence.where('0=1')
    redirect_to root_url
  end

  def filter_set
    $serach_params['engine_type_filter_id'] = params['engine_type_filter_id']
    $serach_params['engine_operator_filter_id'] = params['engine_operator_filter_id']
    $serach_params['engine_id'] = params['engine_id']
    $serach_params['series'] = params['series']
    $serach_params['name'] = params['name']
    $serach_params['literature_id'] = params['literature_id']
    $serach_params['volume'] = params['volume']
    $serach_params['number'] = params['number']
    $serach_params['year'] = params['year']
    $serach_params['page'] = params['page']
    $serach_params['view_id'] = params['view_id']
    $serach_params['quality_id'] = params['quality_id']
    $serach_params['location'] = params['location']
    $serach_params['tender'] = params['tender']
    $serach_params['tender_series'] = params['tender_series']
    $serach_params['detail'] = params['detail']
    $serach_params['operator_id'] = params['operator_id']
    $serach_params['maker_id'] = params['maker_id']
    $serach_params['private'] = params['private']
    $serach_params['synonyms'] = params['synonyms']
  end

  def search
    filter_set

    search_query = ""
    unless params['engine_id'].empty?
      synonyms = nil
      if params['synonyms'] == 'on' || params['synonyms'] == '1'
        engine = Engine.find(params['engine_id'].to_i)
        if engine
          if engine.alternate_for.nil? || engine.alternate_for == ''
            synonyms = Engine.where("id = #{params['engine_id'].to_i} or alternate_for = #{params['engine_id'].to_i}")
          else
            synonyms = Engine.where("id = #{engine.alternate_for} or alternate_for = #{engine.alternate_for}")
          end
        end
      end
      if synonyms.nil?
        search_query += "engine_id = #{params['engine_id'].to_i} and "
      else
        synlist = synonyms.all.collect{|m| m.id}
        search_query += "engine_id in (#{synlist.join(', ')}) and "
      end
    end
    unless params['series'].empty?
      search_query += "series LIKE '#{params['series']}' and "
    end
    unless params['name'].empty?
      search_query += "name LIKE '#{params['name']}' and "
    end
    unless params['literature_id'].empty?
      search_query += "literature_id = #{params['literature_id'].to_i} and "
    end
    unless params['volume'].empty?
      search_query += "volume LIKE '#{params['volume']}' and "
    end
    unless params['number'].empty?
      search_query += "number LIKE '#{params['number']}' and "
    end
    unless params['year'].empty?
      search_query += "year LIKE '#{params['year']}' and "
    end
    unless params['page'].empty?
      search_query += "page LIKE '#{params['page']}' and "
    end
    unless params['view_id'].empty?
      search_query += "view_id = #{params['view_id'].to_i} and "
    end
    unless params['quality_id'].empty?
      search_query += "quality_id = #{params['quality_id'].to_i} and "
    end
    unless params['location'].empty?
      search_query += "location LIKE '#{params['location']}' and "
    end
    unless params['tender'].empty?
      search_query += "tender = #{params['tender'].to_i} and "
    end
    unless params['tender_series'].empty?
      search_query += "tender_series LIKE '#{params['tender_series']}' and "
    end
    unless params['detail'].empty?
      search_query += "detail = #{params['detail'].to_i} and "
    end
    unless params['operator_id'].empty?
      search_query += "operator_id = #{params['operator_id'].to_i} and "
    end
    unless params['maker_id'].empty?
      search_query += "maker_id = #{params['maker_id'].to_i} and "
    end
    if !$current_user.nil? && params['private'] == '1'
      search_query += "useer_id = #{$current_user.id} and "
    end
    search_query += "1=1"
    $search_result = Occurrence.where(search_query)
    redirect_to root_url
  end

  def filter_type
    $serach_params['engine_type_filter_id'] = params['id']
  end

  def filter_operator
    $serach_params['engine_operator_filter_id'] = params['id']
  end
end

