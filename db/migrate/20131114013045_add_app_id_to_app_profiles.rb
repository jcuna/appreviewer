class AddAppIdToAppProfiles < ActiveRecord::Migration
  def change
  	add_column :app_profiles, :app_id, :integer
  end
end
