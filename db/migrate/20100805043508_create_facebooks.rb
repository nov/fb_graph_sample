class CreateFacebooks < ActiveRecord::Migration
  def self.up
    create_table :facebooks do |t|
      t.integer :identifier, :unsigned => true, :limit => 20
      t.string :access_token
      t.timestamps
    end
  end

  def self.down
    drop_table :facebooks
  end
end
