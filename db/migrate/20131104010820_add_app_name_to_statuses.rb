class AddAppNameToStatuses < ActiveRecord::Migration
  def change
  	add_column :statuses, :appName, :string
  	add_index :statuses, :appName

  end
end
