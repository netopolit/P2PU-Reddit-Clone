class AddScoreToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :score, :integer, :default => 0
  end

  def self.down
    remove_column :links, :score
  end
end
