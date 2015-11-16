class Group < ActiveRecord::Base
  has_many :members, dependent: :destroy
end
