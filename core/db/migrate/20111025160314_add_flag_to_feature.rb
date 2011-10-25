class AddFlagToFeature < ActiveRecord::Migration
  def self.up
    add_column :features, :flag, :string
  end

  def self.down
    remove_column :features, :flag
  end
end
