module MakersHelper
  def makers_list
    Maker.order(:name).collect{|m| [m.name, m.id]}
  end
end
