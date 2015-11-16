class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.string :comment
      t.string :due
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
