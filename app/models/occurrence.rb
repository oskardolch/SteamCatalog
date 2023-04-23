class Occurrence < ApplicationRecord
  belongs_to :engine, :required=>false
  belongs_to :literature
  belongs_to :view, :required=>false
  belongs_to :quality, :required=>false
  belongs_to :user, :required=>false
  belongs_to :operator, :required=>false
  belongs_to :maker, :required=>false
  belongs_to :tender_obj, class_name: 'Engine', primary_key: 'id', foreign_key: 'tender', :required=>false
  belongs_to :detail_obj, class_name: 'Accessory', primary_key: 'id', foreign_key: 'detail', :required=>false
end
