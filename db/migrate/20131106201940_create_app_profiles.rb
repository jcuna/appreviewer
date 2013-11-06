class CreateAppProfiles < ActiveRecord::Migration
  def change
    create_table :app_profiles do |t|
      t.string :name

      t.timestamps
    end
  end
end
