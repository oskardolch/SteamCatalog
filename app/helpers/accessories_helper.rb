module AccessoriesHelper
  def accessories_list
    Accessory.all.collect{|m| [m.name, m.id]}
  end
end
