module OperatorsHelper
  def operators_list
    Operator.order(:name).collect{|m| [m.name, m.id]}
  end
end
