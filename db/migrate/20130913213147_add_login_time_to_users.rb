class AddLoginTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :loginTime, :timestamp
  end
end
