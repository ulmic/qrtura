class Admin < ActiveRecord::Base
  attr_accessible :login,
                  :password

  validates :login, length: { minimum: 3, maximum: 8 }
  validates :password, length: { minimum: 3, maximum: 16 }
end
