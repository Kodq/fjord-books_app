class AddUseridToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :userid, :integer
  end
end
