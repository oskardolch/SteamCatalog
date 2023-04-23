class Literature < ApplicationRecord
  belongs_to :editor, :required=>false
end
