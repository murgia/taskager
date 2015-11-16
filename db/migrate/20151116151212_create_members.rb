class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :image_url
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
