class AddApplicationToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :application, :string

  end
end
