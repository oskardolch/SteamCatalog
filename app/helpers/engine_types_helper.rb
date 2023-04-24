module EngineTypesHelper
  def engine_types_list
    EngineType.order(:name).collect{|m| [m.name, m.id]}
  end
end
