module MakersHelper
  def makers_list
    Maker.all.collect{|m| [m.name, m.id]}
  end
end
