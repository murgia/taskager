class Member < ActiveRecord::Base
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :tasks, through: :memberships
end
