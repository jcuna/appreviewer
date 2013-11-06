class AddAppIdToStatuses < ActiveRecord::Migration
  def change
  	add_column :statuses, :app_id, :integer
  	add_index :statuses, :app_id
  	remove_column :statuses, :appName
  end
end