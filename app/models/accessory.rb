class Accessory < ApplicationRecord
  belongs_to :maker, :required=>false
end
