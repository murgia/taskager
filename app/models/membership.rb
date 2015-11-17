class Membership < ActiveRecord::Base
  belongs_to :member
  belongs_to :group
  has_many :tasks
end
