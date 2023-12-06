class RemoveTodoFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :todo, :string
  end
end
