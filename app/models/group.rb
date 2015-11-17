class Group < ActiveRecord::Base
  has_many :memberships
  has_many :members, through: :memberships
  has_many :tasks, through: :memberships
end
