class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.string :comment
      t.string :due_by
      t.references :membership, index: true, foreign_key: true
    end
  end
end
