module LiteraturesHelper
  def literatures_list
    Literature.all.collect{|m| [m.title, m.id]}
  end
end
