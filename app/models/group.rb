class Group < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, dependent: :destroy
  has_many :tasks, through: :memberships, dependent: :destroy
end
