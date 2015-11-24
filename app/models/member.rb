class Member < ActiveRecord::Base
  # I think we've talked about this a bit, but I think this model could be entirely replace with the devise user model.
  # Unless the thought process was that this was completely an administrative only tool. But I think that limits scalability
  # Actually the more I think about it, I think its completely dependent on the domain model you're going for. Maybe you do want to use devise strictly just for auth.
  has_many :memberships, dependent: :destroy
  has_many :groups, through: :memberships, dependent: :destroy
  has_many :tasks, through: :memberships, dependent: :destroy
end
