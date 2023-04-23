class User < ApplicationRecord
  has_secure_password
  validates :name, :presence => true, :uniqueness => {case_sensitive: false}
  validates :password, :confirmation => true
  validates :password_confirmation, :presence => true, :on => create
end
