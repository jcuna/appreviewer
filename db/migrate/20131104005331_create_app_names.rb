class CreateAppNames < ActiveRecord::Migration
  def change
    create_table :app_names do |t|

      t.timestamps
    end
  end
end
