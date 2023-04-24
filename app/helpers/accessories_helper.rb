module AccessoriesHelper
  def accessories_list
    Accessory.order(:name).collect{|m| [m.name, m.id]}
  end
end
