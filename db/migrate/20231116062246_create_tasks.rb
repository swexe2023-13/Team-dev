class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :todo
      t.datetime :date
      t.string :memo

      t.timestamps
    end
  end
end
