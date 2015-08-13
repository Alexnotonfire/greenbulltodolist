class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :due_date
      t.integer :user_id
      t.integer :priority
      t.boolean :complete
      t.timestamps null: false
    end
  end
end
