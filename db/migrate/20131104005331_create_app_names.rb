class CreateAppNames < ActiveRecord::Migration
  def change
    create_table :app_names do |t|
      t.string :appName
      t.timestamps
    end
  end
end
