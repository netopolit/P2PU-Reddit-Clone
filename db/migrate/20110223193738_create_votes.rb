class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :user_id
      t.integer :link_id
      t.integer :points
      t.timestamps
    end
    add_index :votes, :user_id
    add_index :votes, :link_id
  end

  def self.down
    drop_table :votes
  end
end
