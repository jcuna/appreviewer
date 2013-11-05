class AddAppNameToAppName < ActiveRecord::Migration
  def change
    add_column :app_names, :appName, :string
  end
end
