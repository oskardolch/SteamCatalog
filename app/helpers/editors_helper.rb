module EditorsHelper
  def editors_list
    Editor.all.collect{|m| [m.name, m.id]}
  end
end
