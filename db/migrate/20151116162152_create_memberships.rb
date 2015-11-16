class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :group, index: true, foreign_key: true
      t.references :member, index: true, foreign_key: true
    end
  end
end
