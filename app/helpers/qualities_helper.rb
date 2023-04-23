module QualitiesHelper
  def qualities_list
    Quality.all.collect{|m| [m.name, m.id]}
  end
end
