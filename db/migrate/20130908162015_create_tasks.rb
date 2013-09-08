class CreateTasks < ActiveRecord::Migration
  def change
     add_index :users, :email, unique: true
  end
  
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :notes
      t.boolean :status

      t.timestamps
    end
  end
end
