module LiteraturesHelper
  def literatures_list
    Literature.order(:title).collect{|m| [m.title, m.id]}
  end
end
