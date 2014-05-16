class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.integer :total_votes, :default => 0
      t.timestamps
    end
  end
end
