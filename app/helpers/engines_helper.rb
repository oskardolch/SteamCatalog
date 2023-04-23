module EnginesHelper
  def engines_list
    nothing = ""
    Engine.all.collect{|m| ["#{m.class_no} - #{m.operator ? m.operator.name : nothing}", m.id]}
  end
end
