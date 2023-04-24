module EditorsHelper
  def editors_list
    Editor.order(:name).collect{|m| [m.name, m.id]}
  end
end
