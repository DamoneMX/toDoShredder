class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :firstName
      t.string :lastName
      t.string :password

      t.timestamps
    end
  end
end
