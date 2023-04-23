class Engine < ApplicationRecord
  belongs_to :operator, :required=>false
  belongs_to :engine_type, :required=>false
end
