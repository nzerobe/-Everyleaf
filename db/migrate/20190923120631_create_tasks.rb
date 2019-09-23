class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :content
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
