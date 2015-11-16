class Group < ActiveRecord::Base
  has_many :memberships
  has_many :tasks, through: :memberships
end
