class RemoveColumnNameInCalls < ActiveRecord::Migration[7.0]
  def change
    remove_column :calls, :name
  end
end
