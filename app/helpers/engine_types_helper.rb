module EngineTypesHelper
  def engine_types_list
    EngineType.all.collect{|m| [m.name, m.id]}
  end
end
