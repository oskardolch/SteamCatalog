module OperatorsHelper
  def operators_list
    Operator.all.collect{|m| [m.name, m.id]}
  end
end
