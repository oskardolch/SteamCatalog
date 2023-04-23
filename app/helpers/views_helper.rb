module ViewsHelper
  def views_list
    View.all.collect{|m| [m.name, m.id]}
  end
end
